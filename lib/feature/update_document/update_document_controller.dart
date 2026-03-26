part of '../../pages.dart';

class UpdateDocumentController extends GetxController {
  UpdateDocumentController({required this.role});

  final String role;

  bool get isCompany => role == 'company';

  // candidate
  final portfolioFile = Rxn<File>();
  final cvFile = Rxn<File>();
  final experienceFile = Rxn<File>();
  final certificateFile = Rxn<File>();

  final portfolioUploadedAt = Rxn<DateTime>();
  final cvUploadedAt = Rxn<DateTime>();
  final experienceUploadedAt = Rxn<DateTime>();
  final certificateUploadedAt = Rxn<DateTime>();

  // company
  final nibFile = Rxn<File>();
  final npwpFile = Rxn<File>();
  final skuFile = Rxn<File>();
  final recruiterIdFile = Rxn<File>();

  final nibUploadedAt = Rxn<DateTime>();
  final npwpUploadedAt = Rxn<DateTime>();
  final skuUploadedAt = Rxn<DateTime>();
  final recruiterIdUploadedAt = Rxn<DateTime>();

  static const int maxSizeInBytes = 3 * 1024 * 1024;

  Future<void> pickFile(Rxn<File> target, Rxn<DateTime> timeTarget) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: false,
    );

    if (result == null || result.files.single.path == null) return;

    final file = File(result.files.single.path!);
    final fileSize = await file.length();

    if (fileSize > maxSizeInBytes) {
      SnackbarHelper.info('Maximum file size is 3MB');
      return;
    }

    target.value = file;
    timeTarget.value = DateTime.now();
  }
}
