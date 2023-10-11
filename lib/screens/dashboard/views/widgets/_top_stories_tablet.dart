part of '../../dashboard.dart';

class _TopStoriesTablet extends StatelessWidget {
  const _TopStoriesTablet({Key? key}) : super(key: key);


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
              return SingleChildScrollView(
                  padding: Space.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: state.data!
                        .map(
                          (news) => HeadlinesCard(news: news!),
                        )
                        .toList(),
                  ),
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
