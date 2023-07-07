part of '../../dashboard.dart';

class _ArticleTablet extends StatefulWidget {
  const _ArticleTablet({Key? key}) : super(key: key);

  @override
  State<_ArticleTablet> createState() => _ArticleTabletState();
}

class _ArticleTabletState extends State<_ArticleTablet> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final articleCubit = ArticlesCubit.cubit(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Top Stories',
          style: AppText.h1b,
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
              return const LinearProgressIndicator();
            } else if (state is ArticlesFetchSuccess) {
              return /*Expanded(
                child:*/ SingleChildScrollView(
                  padding: Space.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: state.data!
                        .map(
                          (articles) => ArticleCard(article: articles),
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
