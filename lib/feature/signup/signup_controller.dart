part of '../../pages.dart';

class SignupController extends GetxController {
  var image = Rx<File?>(null);

  final selectedItem = Rxn<Map<String, String>>();

  final company_name = TextEditingController();

  final isCompany = false.obs;

  void select(Map<String, String> item) {
    selectedItem.value = item;

    final title = item['title'] ?? '';
    final id = item['id'] ?? '';

    isCompany.value = (id == '1');

    if (!isCompany.value) {
      company_name.clear();
    }

    debugPrint(
      'Selected register as: title="$title", id="$id", isCompany=${isCompany.value}',
    );
  }

  @override
  void onInit() {
    super.onInit();
    select(const {'title': 'Candidate', 'id': '2'});
  }

  @override
  void onClose() {
    company_name.dispose();
    super.onClose();
  }
}
