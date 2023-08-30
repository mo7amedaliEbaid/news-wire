import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../configs/app_dimensions.dart';
import '../configs/app_theme.dart';
import '../configs/app_typography.dart';
import '../configs/space.dart';
import '../models/article/article.dart';
import '../screens/article_content/article_content.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: Space.all(0, 0.5),
      padding: Space.all(0.5, 1),
      decoration: BoxDecoration(
        color: AppTheme.c!.background,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(3)),
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
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleContentScreen(
              article: article,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                if (article.urlToImage != null)
                  SizedBox(
                    width: AppDimensions.normalize(45),
                    height: AppDimensions.normalize(45),
                    child:/* article.urlToImage == null
                        ? Lottie.asset(
                            "assets/lotties/news-icon-animation-customizable.json")
                        : */CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            errorWidget: (context, url, error) => Lottie.asset(
                                "assets/lotties/news-icon-animation-customizable.json"),
                            placeholder: (context, string) {
                              return Lottie.asset(
                                  "assets/lotties/news-icon-animation-customizable.json"); /*Center(
                          child: Text(
                            'News App',
                            style: AppText.b1b!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        );*/
                            },
                          ),
                  )
                else
                  SizedBox(
                      width: AppDimensions.normalize(45),
                      height: AppDimensions.normalize(45),
                      child: Lottie.asset(
                          "assets/lotties/news-icon-animation-customizable.json") /*Center(
                      child: Text(
                        'News App',
                        style: AppText.b1b!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),*/
                      ),
                Text(
                  DateFormat('EE d, yyyy').format(
                    DateTime.parse(
                      article.publishedAt ?? DateTime.now().toString(),
                    ),
                  ),
                  style: AppText.b2,
                )
              ],
            ),
            Space.x1!,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "",
                    style: AppText.h3b!,
                    maxLines: 2,
                  ),
                  Space.y!,
                  Text(
                    article.source?.name ?? "",
                    style: AppText.b2b,
                  ),
                  Space.y!,
                  Text(
                    article.description ?? "",
                    maxLines: 3,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
