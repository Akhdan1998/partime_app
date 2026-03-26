part of '../../pages.dart';

class VacancyDetailController extends GetxController {
  final role = 'company'.obs;
  final view = 'company'.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args is Map<String, dynamic>) {
      role.value = (args['role'] as String?) ?? 'company';
      view.value = (args['view'] as String?) ?? role.value;
    } else if (args is String) {
      role.value = args;
      view.value = args;
    }
  }

  bool get isCompany => role.value == 'company';
  bool get isCandidateView => view.value == 'candidate';
  bool get isCompanyView => view.value == 'company';
}