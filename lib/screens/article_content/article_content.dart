import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_wire/responsive/responsive.dart';
import 'package:news_wire/utils/app_utils.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../models/article/article.dart';

class ArticleContentScreen extends StatelessWidget {
  final Article article;

  const ArticleContentScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: AppDimensions.normalize(10),
          ),
        ),
      ),
      body: !Responsive.isDesktop(context)
          ? SingleChildScrollView(
              child: Padding(
                padding: Space.all(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Space.y!,
                    Text(
                      article.title ?? "",
                      style: AppText.h1b,
                    ),
                    Space.y!,
                    article.urlToImage == null
                        ? Center(child: Text("No Details Available"))
                        : CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            errorWidget: (context, url, error) =>
                                Lottie.asset(AppUtils.splashLottie),
                            placeholder: (context, string) {
                              return Lottie.asset(AppUtils.splashLottie);
                            }),
                    Space.y1!,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.author ?? "",
                          style: AppText.b2b,
                        ),
                        TextButton(
                          onPressed: () => article.url == null
                              ? null
                              : launchUrl(Uri.parse(article.url!)),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: math.pi * 0.70,
                                child: const Icon(Icons.link_rounded,),
                              ),
                              Space.xf(0.25),
                              Text(
                                article.source?.name ?? "",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Space.y1!,
                    Text(
                      article.content ?? "",
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: Space.h2!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: Space.v2!,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              article.title ?? "",
                              style: AppText.h2b,
                            ),
                          ),
                          Flexible(flex: 2, child: Space.y1!),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: Space.hf(3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    article.author ?? "",
                                    style: AppText.b2b,
                                  ),
                                  Space.x2!,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () => article.url == null
                                            ? null
                                            : launchUrl(
                                                Uri.parse(article.url!)),
                                        child:  Icon(Icons.link_rounded,size: AppDimensions.normalize(20),),
                                      ),
                                      Space.x!,
                                      Text(
                                        article.source!.name!,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              width: AppDimensions.normalize(280),
                              height: AppDimensions.normalize(150),
                              child: Center(
                                child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    article.content ?? "",
                                    maxLines: 9,
                                    style: AppText.b1b),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: article.urlToImage == null
                        ? Center(
                            child: Text("No Image Available"),
                          )
                        : CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            width: AppDimensions.normalize(420),
                            height: AppDimensions.normalize(300),
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                Lottie.asset(AppUtils.placeholderLottie),
                            placeholder: (context, string) {
                              return Lottie.asset(AppUtils.placeholderLottie);
                            }),
                  )
                ],
              ),
            ),
    );
  }
}
