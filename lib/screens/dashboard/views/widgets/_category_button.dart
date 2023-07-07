part of '../../dashboard.dart';

class _CategoryCustomButton extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;

  const _CategoryCustomButton({
    Key? key,
    required this.categoryIndex,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final newsCubit = BlocProvider.of<TopHeadlinesCubit>(context);

    return InkWell(
      onTap: () {
        categoryProvider.categoryIndexUpdate = categoryIndex;
        newsCubit.fetch(categoryName,"","");
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        opacity: categoryProvider.categoryIndexGet == categoryIndex ? 1 : 0.5,
        child: Container(
          margin: Space.h2,
          padding: Space.all(),
          decoration: BoxDecoration(
            color: categoryProvider.categoryIndexGet == categoryIndex
                ? AppTheme.c!.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              AppDimensions.normalize(2),
            ),
          ),
          child: Center(
            child: Text(
              toBeginningOfSentenceCase(
                categoryName,
              )!,
              style: AppText.b2!.copyWith(
                fontWeight: categoryProvider.categoryIndexGet == categoryIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: categoryProvider.categoryIndexGet == categoryIndex
                    ? Colors.white
                    : AppTheme.c!.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
