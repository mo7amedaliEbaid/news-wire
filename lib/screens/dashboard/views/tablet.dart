part of '../dashboard.dart';

class DashboardTablet extends StatefulWidget {
  const DashboardTablet({Key? key}) : super(key: key);

  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {
  final List<Widget> views = const [
    _TopStoriesTablet(),
    _ArticleTablet(),
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tabs = Provider.of<TabProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.y1!,
                    Row(
                      children: [
                        Space.x!,
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
                              color:
                                  themeProvider.isDark ? Colors.yellow : Colors.grey,
                              size: AppDimensions.normalize(15),
                            ),
                          ),
                        ),
                        Space.x1!,
                      /*  Expanded(
                          child: */Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Get Informed',
                                style: AppText.h1b!.copyWith(
                                  height: 1.1,
                                ),
                              ),
                              Text(
                                DateFormat('EEEE, dd MMM').format(DateTime.now()),
                                style: AppText.b2!.copyWith(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                      //  ),
                        //Space.xf(8),
                        Space.x2!,
                        Expanded(
                          child:Container(
                            padding: Space.all(0.5, 0.4),
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
                       ),
                        Space.x1!,
                      ],
                    ),
                    Space.y2!,
                 /*   Expanded(
                      child:*/ Padding(
                        padding: Space.h1!,
                        child: views[tabs.index],
                      ),
                   // )
                  ],

              ),
            ),

        ),
      ),
    );
  }
}
