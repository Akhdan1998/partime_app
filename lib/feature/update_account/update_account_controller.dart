part of '../../pages.dart';

class UpdateProfileController extends GetxController {
  UpdateProfileController({required this.role});

  final String role;

  bool get isCompany => role == 'company';

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final addressC = TextEditingController();

  final Rxn<File> imageFile = Rxn<File>();
  final picker = ImagePicker();
  final selectedGender = Rxn<Gender>();
  final gender = <Gender>[
    Gender(id: '1', gender: 'Male'),
    Gender(id: '2', gender: 'Female'),
    Gender(id: '3', gender: 'Unisex'),
  ].obs;

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile.value = File(picked.path);
    }
  }

  void onSave() {
    debugPrint('SAVE PROFILE');
    Get.back();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    addressC.dispose();
    super.onClose();
  }
}
