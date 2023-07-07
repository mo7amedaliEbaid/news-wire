import 'package:flutter/material.dart';
import 'package:news_wire/configs/configs.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import '../../animations/entrance_fader.dart';
import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_typography.dart';
import '../../providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/dashboard');
    });
  }

  void initTheme() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.init();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initTheme();
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/lotties/global-mobile-news-network.json"),
            Space.y!,
            EntranceFader(
              duration: const Duration(milliseconds: 300),
              offset: const Offset(0, 20),
              child: Text(
                'News Wire',
                style: AppText.h1b!.copyWith(
                  fontSize: AppDimensions.normalize(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
