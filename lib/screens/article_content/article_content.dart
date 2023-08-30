import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
            padding: Space.all(),
            child: MediaQuery.of(context).size.width < 1257
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: BackButton(
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
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
                              errorWidget: (context, url, error) => Lottie.asset(
                                  "assets/lotties/global-mobile-news-network.json"),
                              placeholder: (context, string) {
                                return Lottie.asset(
                                    "assets/lotties/global-mobile-news-network.json");
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
                                  child: const Icon(Icons.link_rounded),
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
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: BackButton(
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Space.y!,
                      Text(
                        article.title ?? "",
                        style: AppText.h1b,
                      ),
                      Space.y!,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            article.author ?? "",
                            style: AppText.b2b,
                          ),
                          Space.xf(30),
                          TextButton(
                            onPressed: () => article.url == null
                                ? null
                                : launchUrl(Uri.parse(article.url!)),
                            child: const Icon(Icons.link_rounded),
                          ),
                          Text(
                            article.source!.name!,
                          ),
                        ],
                      ),
                      Space.y2!,
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          article.urlToImage==null?
                              Center(child: Text("No Image Available"),):
                          CachedNetworkImage(
                              imageUrl: article.urlToImage!,
                              width: AppDimensions.normalize(420),
                              height: AppDimensions.normalize(300),
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) => Lottie.asset(
                                  "assets/lotties/global-mobile-news-network.json"),
                              placeholder: (context, string) {
                                return Lottie.asset(
                                    "assets/lotties/global-mobile-news-network.json");
                              }),

                          Space.x2!,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Space.yf(9),
                                Container(
                                  width: AppDimensions.normalize(280),
                                  height: AppDimensions.normalize(200),
                                  child: AutoSizeText(
                                      overflow: TextOverflow.ellipsis,
                                      article.content??"",
                                      maxLines: 5,
                                      style: AppText.h1b),
                                ),
                              ],
                            ),
                          ),
                          // Space.y1!,
                        ],
                      ),
                      Space.y2!
                    ],
                  )),
      ),
    );
  }
}
