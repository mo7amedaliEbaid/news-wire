part of '../../dashboard.dart';

class _TopStoriesTablet extends StatelessWidget {
  const _TopStoriesTablet({Key? key}) : super(key: key);

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Top Stories',
          style: AppText.h1b,
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
                child:*/ SingleChildScrollView(
                  padding: Space.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: state.data!
                        .map(
                          (news) => HeadlinesCard(news: news!),
                        )
                        .toList(),
                  ),
             //   ),
              );
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
    );
  }
}
