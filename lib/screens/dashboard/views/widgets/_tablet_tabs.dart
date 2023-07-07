part of '../../dashboard.dart';

class _TabletTabs extends StatelessWidget {
  final MapEntry entry;
  const _TabletTabs({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = Provider.of<TabProvider>(context);
    final isSelected = tabs.index == entry.key;

    return/* Expanded(
      child:*/ InkWell(
        onTap: () => tabs.index = entry.key,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          padding: Space.all(1, 0),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.c!.primary : null,
            borderRadius: BorderRadius.circular(
              UIProps.radius,
            ),
          ),
          child: Center(
            child: Text(
              entry.value,
              style: isSelected
                  ? AppText.b1!.copyWith(
                      color: Colors.white,
                      height: 1.2,
                    )
                  : AppText.b1,
              textAlign: TextAlign.center,
            ),
          ),
     //   ),
      ),
    );
  }
}
