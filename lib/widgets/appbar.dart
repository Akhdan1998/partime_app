part of '../pages.dart';

class CusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool? showBackButton;

  final VoidCallback? onBack;

  final bool showMoreButton;
  final VoidCallback? onMore;

  final List<Widget>? actions;

  const CusAppBar({
    super.key,
    required this.title,
    this.showBackButton,
    this.onBack,
    this.showMoreButton = false,
    this.onMore,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    final bool showBack = showBackButton ?? canPop;

    final bool showMore =
        showMoreButton || onMore != null || (actions?.isNotEmpty ?? false);

    Widget left() {
      if (!showBack) return const SizedBox(width: 44);
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: white,
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: orange, size: 20),
          onPressed: onBack ?? () => Get.back(),
        ),
      );
    }

    Widget right() {
      if (!showMore) return const SizedBox(width: 44);

      if (actions != null && actions!.isNotEmpty) {
        return Row(mainAxisSize: MainAxisSize.min, children: actions!);
      }

      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: white,
        ),
        child: IconButton(
          icon: Icon(Icons.more_vert, color: orange, size: 20),
          onPressed: onMore,
        ),
      );
    }

    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        height: 55,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: AppGradients.orangeGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            left(),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Poppins(
                    color: white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            right(),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
