part of '../../pages.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;
  late final PageController pageController;
  late final String role;

  @override
  void onInit() {
    role = (Get.arguments as String?) ?? 'candidate';
    pageController = PageController();
    super.onInit();
  }

  bool get isCompany => role == 'company';

  List<_NavMenuData> get menus => isCompany
      ? const [
          _NavMenuData(icon: Icons.work_outline, label: 'Vacancy'),
          _NavMenuData(icon: Icons.history, label: 'History'),
          _NavMenuData(icon: Icons.business_outlined, label: 'Company'),
        ]
      : const [
          _NavMenuData(icon: Icons.work_outline, label: 'Vacancy'),
          _NavMenuData(icon: Icons.history, label: 'History'),
          _NavMenuData(icon: Icons.person_outline, label: 'Profile'),
        ];

  List<Widget> get pages => isCompany
      ? [Vacancy(), History(role: role), Profile(role: role)]
      : [Vacancy(), History(role: role), Profile(role: role)];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setIndex(int i) {
    if (i == currentIndex.value) return;

    currentIndex.value = i;
    pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  void onPageChanged(int i) {
    currentIndex.value = i;
  }

  void onPlusTap() {
    Get.dialog(
      Dialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: isCompany ? _companyAction() : _candidateAction(),
        ),
      ),
      barrierDismissible: true,
    );
  }

  Widget _candidateAction() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonCustom(
          onPressed: () {
            Get.back();
            // route upload experience
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: orange,
            ),
            child: Text(
              'Upload Experience',
              style: Poppins(
                fontSize: 13,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _companyAction() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonCustom(
          onPressed: () {
            Get.back();
            // route create vacancy
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: orange,
            ),
            child: Text(
              'Create Vacancy',
              style: Poppins(
                fontSize: 13,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        _hGap10,
        ButtonCustom(
          onPressed: () {
            Get.back();
            // route upload company document
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: white,
              border: Border.all(width: 1.2, color: orange),
            ),
            child: Text(
              'Upload Document',
              style: Poppins(
                fontSize: 13,
                color: orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NavMenuData {
  final IconData icon;
  final String label;

  const _NavMenuData({required this.icon, required this.label});
}
