part of '../../pages.dart';

class VacancyDetailController extends GetxController {
  final role = 'company'.obs;

  @override
  void onInit() {
    super.onInit();
    role.value = (Get.arguments as String?) ?? 'company';
  }

  bool get isCompany => role.value == 'company';
}
