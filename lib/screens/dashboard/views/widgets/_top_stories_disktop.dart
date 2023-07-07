part of '../../dashboard.dart';

class _TopStoriesDisktop extends StatelessWidget {
  const _TopStoriesDisktop({Key? key}) : super(key: key);

  // local List/Array --> API data push
  // use local list to map Cards

  // scrollController -> ListView | SingleScrollView

  // onLoading:
  // check if controller == end of screen
  // API call --> local list++;

  // onRefresh:
  // local list = [] empty;
  // API (one time) --> local list store;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      margin: Space.all(2.5, 0),
    //  padding: Space.h1,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment:/* MediaQuery
                  .of(context)
                  .size
                  .width > 1625 ?Alignment.center:*/ Alignment.centerLeft,
              child:MediaQuery
                  .of(context)
                  .size
                  .width > 1625 ? Padding(
                    padding: Space.hf(6.5),
                    child: Text(
                'Top Stories',
                style: AppText.h1b,
              ),
                  ):
              Text(
                'Top Stories',
                style: AppText.h1b,
              ),
            ),
            Space.y!,
            const CategoryTabs(),
            Space.y1!,
            BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
              builder: (context, state) {
                if (state is TopHeadlinesLoading) {
                  return const LinearProgressIndicator();
                } else if (state is TopHeadlinesSuccess) {
                  return /*Expanded(
                    child: */ //SingleChildScrollView(
                      //    padding: Space.h,
                      //   child:
                      Wrap(
                 crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 25,
                    children: state.data!
                        .map(
                          (news) => HeadlinesCard(news: news!),
                        )
                        .toList(),
                  );
                  /* Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: state.data!
                            .map(
                              (news) => HeadlinesCard(news: news!),
                        )
                            .toList(),
                      ),*/
                  //  ),
                  //   );
                } else {
                  return const Center(
                    child: Text(
                      'Something went wrong',
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
