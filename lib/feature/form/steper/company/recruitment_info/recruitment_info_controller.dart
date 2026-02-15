part of '../../../../../pages.dart';

class RecruitmentInfoController extends GetxController {
  late final String role;
  late final PageController pageController;

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    role = (Get.arguments as String?) ?? 'candidate';
    pageController = PageController();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}