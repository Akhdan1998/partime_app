part of '../../../../../pages.dart';

class DocumentCandidate extends StatefulWidget {
  const DocumentCandidate({super.key});

  @override
  State<DocumentCandidate> createState() => _DocumentCandidateState();
}

class _DocumentCandidateState extends State<DocumentCandidate> {
  final controller = Get.put(DocumentCandidateController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filePickerSection(
            title: 'Portofolio',
            description:
            'Upload a portfolio to strengthen your application. You can change it at any time, and you can attach this file to your application. (PDF, max. 3MB)',
            fileRx: controller.portofolioFile,
            timeRx: controller.portofolioUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'CV',
            description:
            'Upload your main CV. This will be used automatically when applying, unless you choose a different file. (PDF, max. 3MB)',
            fileRx: controller.cvFile,
            timeRx: controller.cvUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'Experience Letter',
            description:
            'Upload a work experience letter (if any) to support your CV. This document is optional and can be attached when applying. (PDF, max. 3MB)',
            fileRx: controller.experienceFile,
            timeRx: controller.experienceUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'Certificate',
            description:
            'Upload a certificate to enhance your skills. Certificates are optional and can be attached to your application. (PDF, max. 3MB)',
            fileRx: controller.certificateFile,
            timeRx: controller.certificateUploadedAt,
          ),
        ],
      ),
    );
  }

  Widget _filePickerSection({
    required String title,
    required String description,
    required Rxn<File> fileRx,
    required Rxn<DateTime> timeRx,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Poppins(fontWeight: FontWeight.w500, fontSize: 13)),
        _hGap10,

        Obx(() {
          final file = fileRx.value;
          final time = timeRx.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonCustom(
                    onPressed: () =>
                        controller.pickFile(fileRx, timeRx),
                    child: Container(
                      alignment: Alignment.center,
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orange,
                      ),
                      child: Icon(
                        file == null ? Icons.add : Icons.check,
                        color: white,
                      ),
                    ),
                  ),
                  _wGap10,
                  Expanded(
                    child: Text(
                      file == null
                          ? 'No file selected'
                          : file.path.split('/').last,
                      style: Poppins(fontSize: 10, color: grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              if (time != null) ...[
                _hGap5,
                Text(
                  'Uploaded at: ${formatDateTime(time)}',
                  style: Poppins(
                    fontSize: 10,
                    color: green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          );
        }),

        _hGap10,
        Text(description, style: Poppins(color: grey, fontSize: 12)),
      ],
    );
  }
}
