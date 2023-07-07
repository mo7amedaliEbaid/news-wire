import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configs/app.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_theme.dart';
import '../configs/app_typography.dart';
import '../configs/space.dart';
import '../models/news.dart';
import '../providers/theme_provider.dart';

class HeadlinesCard extends StatelessWidget {
  final News news;

  const HeadlinesCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    Size size = MediaQuery.sizeOf(context);
/*if(size.width<1575&&size.width>992){
return ;
}*/
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: size.width < 1575 && size.width > 992
          ? AppDimensions.normalize(370)
          : AppDimensions.normalize(230),
      height: AppDimensions.normalize(50),
      //double.infinity,
      margin: Space.all(0, 0.5),
      padding: Space.all(0.5, 1),
      decoration: BoxDecoration(
        color: AppTheme.c!.background,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 10),
            blurRadius: 12,
            spreadRadius: 6.0,
          )
        ],
      ),
      child: InkWell(
        onTap: () => launchUrl(
          Uri.parse(news.url),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: AppDimensions.normalize(35),
                height: AppDimensions.normalize(35),
                decoration: BoxDecoration(
                  color: themeProvider.isDark
                      ? Colors.grey[800]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(3),
                  ),
                ),
                child: Lottie.asset(
                    "assets/lotties/news-icon-animation-customizable.json") /*Center(
                child: Text(
                  news.name.substring(0, 1),
                  style: AppText.h1b!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),*/
                ),
            Space.x1!,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.description.length > 150
                        ? '${news.description.substring(0, 50)}...'
                        : news.description,
                    style: AppText.h3b!
                        .copyWith(height: 1.1, overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                  Space.y!,
                  Row(
                    children: [
                      Text(
                        '${App.flag(news.country)} ${news.name}',
                        style: AppText.b2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
