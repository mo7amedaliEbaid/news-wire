part of '../dashboard.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({Key? key}) : super(key: key);

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Exit Application",
            ),
            content: const Text(
              "Are You Sure?",
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final articleCubit = ArticlesCubit.cubit(context);
    final newsCubit = BlocProvider.of<TopHeadlinesCubit>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: Space.h1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Space.y1!,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                            /*AppLocalization.of(context)
                            .getTranslatedValue("title")
                            .toString(),*/
                              "Get\nInformed",
                              style: AppText.h1b!.copyWith(
                                fontSize: AppDimensions.normalize(13),
                                height: 1.1,
                              ),
                              maxLines: 2,
                            ),
                            Space.y!,
                            Text(
                              DateFormat('EEEE, dd MMM').format(DateTime.now()),
                              style: AppText.l1!.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Space.xm!,
                    /*  Consumer<LocaleProvider>(builder: (context,localedata,_){
                        return  Expanded(
                          child: Stack(
                            children: [
                              InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  localedata.changelan_status();
                                  localedata.isenglish == true
                                      ? localedata.updateLocale(localedata.changeLanguage(
                                      Language
                                          .languageList()
                                          .first, context))
                                      : localedata.updateLocale(localedata.changeLanguage(
                                      Language
                                          .languageList()
                                          .last, context));
                                },
                                child: Container(
                                  height: AppDimensions.normalize(30),
                                  width: AppDimensions.normalize(30),
                                  decoration: BoxDecoration(
                                    color: themeProvider.isDark
                                        ? Colors.grey[800]
                                        : Colors.green[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.language,
                                    color: themeProvider.isDark
                                        ? Colors.yellow
                                        : Colors.grey,
                                    size: AppDimensions.normalize(15),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  child: localedata.isenglish==true?Text("EN"):Text("Ar"))
                            ],
                          ),
                        );
                      }),
                      Space.x!,
                      Expanded(
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                            showCountryPicker(context: context, onSelect: (Country value){
                           //   log(value.countryCode);
                           newsCubit.fetch("",""*//*value.countryCode.toLowerCase().toString()*//*,"");
                            },
                              countryListTheme: CountryListThemeData(
                                backgroundColor:const Color(0xffd5e6b1),

                              )
                            );
                          },
                          child: Container(
                            height: AppDimensions.normalize(30),
                            width: AppDimensions.normalize(30),
                            decoration: BoxDecoration(
                              color: themeProvider.isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.flag,
                              color: themeProvider.isDark
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: AppDimensions.normalize(15),
                            ),
                          ),
                        ),
                      ),
                      Space.x!,*/
                      Expanded(
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                        //    throw Exception();
                            themeProvider.theme = !themeProvider.theme;
                          },
                          child: Container(
                            height: AppDimensions.normalize(30),
                            width: AppDimensions.normalize(30),
                            decoration: BoxDecoration(
                              color: themeProvider.isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.brightness_6_outlined,
                              color: themeProvider.isDark
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: AppDimensions.normalize(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Space.y1!,
                  const CategoryTabs(),
                  Space.y1!,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       /* AppLocalization.of(context)
                            .getTranslatedValue("stories")
                            .toString(),*/
                        "Top Stories",
                        style: AppText.h3b,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pushNamed(
                            context, '/top-stories',
                            arguments: {
                              'title': AppUtils.categories[context
                                  .read<CategoryProvider>()
                                  .categoryIndexGet],
                            }),
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: AppDimensions.normalize(7),
                        ),
                      )
                    ],
                  ),
                  BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
                    builder: (context, state) {
                      if (state is TopHeadlinesLoading) {
                        return Column(
                          children: [
                            const LinearProgressIndicator(),
                            for (int i = 0; i < 3; i++)
                              const _ShimmerArticleCard(
                                isArticle: false,
                              )
                          ],
                        );
                      } else if (state is TopHeadlinesFailure) {
                        return Text(state.error!);
                      } else if (state is TopHeadlinesSuccess) {
                        List<News> recentNews = List.generate(
                            state.data!.length >= 3 ? 3 : state.data!.length,
                            (index) => state.data![index]!);

                        return Column(
                          children: recentNews.map(
                                (news) => BottomAnimator(
                                  child: HeadlinesCard(
                                    news: news,
                                  ),
                                ),
                              ).toList(),
                        );
                      } else {
                        return const Text('Something Went Wrong!');
                      }
                    },
                  ),
                  Space.y2!,
                  Text(
                    'Picks for you',
                    style: AppText.h3b,
                  ),
                  Space.y!,
                  CustomTextField(
                    controller: searchController,
                    hint: 'Search keyword...',
                    textInputType: TextInputType.text,
                    prefixIcon: IconButton(
                      splashRadius: AppDimensions.normalize(8),
                      onPressed: () {
                        if (searchController.text.isNotEmpty) {
                          articleCubit.fetch(
                            keyword: searchController.text.trim(),
                          );
                        }
                      },
                      icon: const Icon(Icons.search),
                    ),
                    onChangeFtn: (value) {
                      if (value == null || value.isEmpty) {
                        articleCubit.fetch();
                      }
                      return value;
                    },
                    isSuffixIcon: true,
                  ),
                  Space.y1!,
                  BlocBuilder<ArticlesCubit, ArticlesState>(
                    builder: (context, state) {
                      if (state is ArticlesFetchLoading) {
                        return Column(
                          children: [
                            const LinearProgressIndicator(),
                            for (int i = 0; i < 3; i++)
                              const _ShimmerArticleCard(
                                isArticle: true,
                              ),
                          ],
                        );
                      } else if (state is ArticlesFetchFailed) {
                        return Text(state.message!);
                      } else if (state is ArticlesFetchSuccess) {
                        List<Article> recentNews = List.generate(
                            state.data!.length, (index) => state.data![index]);
                        return Column(
                          children: recentNews
                              .map(
                                (article) => BottomAnimator(
                                  child: ArticleCard(
                                    article: article,
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return const Center(
                          child: Text('Something Went Wrong!'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
