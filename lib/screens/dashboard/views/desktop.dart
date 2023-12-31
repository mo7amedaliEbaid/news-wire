part of '../dashboard.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({Key? key}) : super(key: key);

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  final List<Widget> views = const [
    _TopStoriesDisktop(),
    _ArticleDesktop(),
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tabs = Provider.of<TabProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: Space.h2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.y1!,
                Container(
                  margin: Space.all(.5, 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Space.x2!,
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
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
                        Space.x1!,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get Informed',
                              style: AppText.h1b!.copyWith(
                                height: 1.1,
                              ),
                            ),
                            Space.x1!,
                            Text(
                              DateFormat('EEEE, dd MMM').format(DateTime.now()),
                              style: AppText.b2!.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        //  ),
                        Space.xm!,
                        Expanded(
                          child: Container(
                            margin: Space.h1,
                            height: AppDimensions.normalize(30),
                            width: AppDimensions.normalize(70),
                            decoration: BoxDecoration(
                                color: themeProvider.isDark
                                    ? Colors.grey[800]
                                    : Colors.grey[200]),
                            child: Image.asset(
                              AppUtils.newsImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Space.xm!,

                        Container(
                          padding: Space.all(0.5, 0.4),
                          margin: Space.all(1.5, 0.4),
                          height: AppDimensions.normalize(22),
                          width: AppDimensions.normalize(100),
                          decoration: BoxDecoration(
                            color: themeProvider.isDark
                                ? AppTheme.c!.background
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(
                              UIProps.radius,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: AppUtils.tabsLabel
                                .asMap()
                                .entries
                                .map(
                                  (e) => _TabletTabs(
                                    entry: e,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Space.x1!,
                      ],
                    ),
                  ),
                ),
                Space.y2!,
                Padding(
                  padding: Space.h1!,
                  child: views[tabs.index],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
