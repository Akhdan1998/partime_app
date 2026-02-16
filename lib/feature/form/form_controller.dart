part of '../../pages.dart';

class FormDataController extends GetxController {
  // final role = 'company';
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
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  String get title => role == 'company' ? 'About the Company' : 'About Me';
}
