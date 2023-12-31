import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:news_wire/providers/category_provider.dart';

import 'package:news_wire/providers/tab_provider.dart';
import 'package:news_wire/providers/theme_provider.dart';
import 'package:news_wire/responsive/responsive.dart';
import 'package:news_wire/screens/dashboard/dashboard.dart';
import 'package:news_wire/screens/splash/splash.dart';
import 'package:news_wire/screens/top_stories/top_stories.dart';

import 'package:provider/provider.dart';
import 'configs/core_theme.dart' as theme;
import 'cubits/articles/cubit.dart';
import 'cubits/top_headlines/cubit.dart';
import 'firebase_options.dart';
import 'models/article/article.dart';
import 'models/article/article_source.dart';
import 'models/news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  Hive.registerAdapter<News>(NewsAdapter());
  Hive.registerAdapter<Article>(ArticleAdapter());
  Hive.registerAdapter<ArticleSource>(ArticleSourceAdapter());

  await Hive.openBox('app');
  await Hive.openBox('newsBox');
  await Hive.openBox('articlesbox');

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => ArticlesCubit()),
        BlocProvider(create: (_) => TopHeadlinesCubit()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialChild(
            provider: themeProvider,
          );
        },
      ),
    );
  }
}

class MaterialChild extends StatelessWidget {
  final ThemeProvider provider;

  const MaterialChild({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Wire',
      debugShowCheckedModeBanner: false,
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      initialRoute: Responsive.isDesktop(context) ? '/dashboard' : '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/top-stories': (context) => const TopStoriesScreen(),
      },
    );
  }
}
