part of '../../pages.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      bottomNavigationBar: _CapsuleBottomNav(controller: controller),
    );
  }
}

class _CapsuleBottomNav extends StatelessWidget {
  final NavigationController controller;

  const _CapsuleBottomNav({required this.controller});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
        child: SizedBox(
          height: 76,
          child: Obx(() {
            final menus = c.menus;
            final index = c.currentIndex.value;

            return _NavCapsule(
              width: MediaQuery.of(context).size.width - 36,
              children: [
                _NavItem(
                  icon: menus[0].icon,
                  label: menus[0].label,
                  isActive: index == 0,
                  onTap: () => c.setIndex(0),
                ),
                _NavItem(
                  icon: menus[1].icon,
                  label: menus[1].label,
                  isActive: index == 1,
                  onTap: () => c.setIndex(1),
                ),
                _NavItem(
                  icon: menus[2].icon,
                  label: menus[2].label,
                  isActive: index == 2,
                  onTap: () => c.setIndex(2),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _NavCapsule extends StatelessWidget {
  final List<Widget> children;
  final double width;

  const _NavCapsule({required this.children, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(99),
        // boxShadow: [
        //   BoxShadow(
        //     color: black.withOpacity(0.12),
        //     blurRadius: 18,
        //     offset: const Offset(0, 8),
        //   ),
        // ],
        // border: Border.all(color: orange, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: isActive ? 120 : 52,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: isActive ? 12 : 0),
        decoration: BoxDecoration(
          color: isActive ? transparentColor : orange,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
            isActive ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22,
                color: isActive ? orange : white,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: child,
                    ),
                  );
                },
                child: isActive
                    ? Padding(
                  key: ValueKey(label),
                  padding: const EdgeInsets.only(left: 8, top: 15),
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Poppins(
                      fontSize: 11,
                      color: orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                    : const SizedBox.shrink(
                  key: ValueKey('empty'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}