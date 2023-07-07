part of '../../dashboard.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.v,
      width: MediaQuery
          .of(context)
          .size
          .width > 1625 ?AppDimensions.normalize(470):double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.c!.background,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 8,
          )
        ],
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: AppUtils.categories
                .asMap()
                .entries
                .map(
                  (e) => _CategoryCustomButton(
                    categoryIndex: e.key,
                    categoryName: e.value,
                  ),
                )
                .toList(),

          ),
        ),
      ),
    );
  }
}
