import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:inform_me/providers/locale_provider.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../animations/bottom_animation.dart';
import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
//import '../../configs/localization.dart';
import '../../configs/space.dart';
import '../../configs/ui_props.dart';
import '../../cubits/articles/cubit.dart';
import '../../cubits/top_headlines/cubit.dart';
import '../../models/article/article.dart';
//import '../../models/language_model.dart';
import '../../models/news.dart';
import '../../providers/category_provider.dart';
import '../../providers/tab_provider.dart';
import '../../providers/theme_provider.dart';
import '../../responsive/responsive.dart';
import '../../utils/app_utils.dart';
import '../../widgets/article_card.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/headlines_card.dart';

part 'views/mobile.dart';
part 'views/desktop.dart';
part 'views/tablet.dart';

part 'views/widgets/_tablet_tabs.dart';
part 'views/widgets/_category_tabs.dart';
part 'views/widgets/_article_tablet.dart';
part 'views/widgets/_category_button.dart';
part 'views/widgets/_top_stories_tablet.dart';
part 'views/widgets/_top_stories_disktop.dart';
part 'views/widgets/_article_disktop.dart';
part 'views/widgets/_shimmer_article_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final newsCubit = BlocProvider.of<TopHeadlinesCubit>(context);
    final articleCubit = BlocProvider.of<ArticlesCubit>(context);

    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    if (newsCubit.state.data == null || newsCubit.state.data!.isEmpty) {
      newsCubit.fetch(
        AppUtils.categories[categoryProvider.categoryIndexGet],"",""
      );
    }
    if (articleCubit.state.data == null || articleCubit.state.data!.isEmpty) {
      articleCubit.fetch(keyword: 'latest');
    }
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: DashboardMobile(),
      tablet: DashboardTablet(),
      desktop: DashboardDesktop(),
    );
  }
}
