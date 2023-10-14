part of '../../dashboard.dart';

class _TopStoriesDisktop extends StatelessWidget {
  const _TopStoriesDisktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      margin: Space.all(2.5, 0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: Space.hf(6.5),
                  child: Text(
                    'Top Stories',
                    style: AppText.h1b,
                  ),
                )),
            Space.y!,
            const CategoryTabs(),
            Space.y1!,
            BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
              builder: (context, state) {
                if (state is TopHeadlinesLoading) {
                  return const LinearProgressIndicator();
                } else if (state is TopHeadlinesSuccess) {
                  return Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 25,
                    children: state.data!
                        .map(
                          (news) => HeadlinesCard(news: news!),
                        )
                        .toList(),
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
        ),
      ),
    );
  }
}
