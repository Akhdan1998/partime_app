part of '../../pages.dart';

class VacancyController extends GetxController {
  final role = 'company'.obs;

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    role.value = Get.arguments ?? 'company';
    super.onInit();
  }

  bool get isCompany => role.value == 'company';

  void changeBottomNav(int index) {
    selectedIndex.value = index;
  }
}