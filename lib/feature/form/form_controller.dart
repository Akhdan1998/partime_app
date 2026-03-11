part of '../../pages.dart';

class FormDataController extends GetxController {
  late final String role;
  final selectedIndex = 0.obs;
  final pageController = PageController();

  @override
  void onInit() {
    role = Get.arguments ?? 'company';
    super.onInit();
  }

  List<Widget> get pages {
    if (role == 'company') {
      return [RecruitmentInfo(), JobDetails(), DocumentCompany()];
    } else {
      return [PersonalData(), Experience(), DocumentCandidate()];
    }
  }

  List<String> get tabs {
    if (role == 'company') {
      return ['Recruitment Info', 'Job Details', 'Document'];
    } else {
      return ['Personal Data', 'Experience', 'Document'];
    }
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  // ===== BOTTOM BUTTON LOGIC =====

  void nextPage() {
    if (selectedIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (selectedIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void simpan() async {
    final result = await Get.to(ReviewForm(), arguments: role);

    if (result != null) {
      changeTab(result);
    }
  }

  String get title => role == 'company' ? 'About the Company' : 'About Me';
}
