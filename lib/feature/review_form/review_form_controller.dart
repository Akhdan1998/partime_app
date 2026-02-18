part of '../../pages.dart';

class ReviewFormController extends GetxController {
  late final String role;

  @override
  void onInit() {
    role = Get.arguments ?? 'company';
    debugPrint('REVIEW ROLE = $role');
    super.onInit();
  }
}