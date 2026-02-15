part of '../../../../../pages.dart';

class DocumentCompany extends StatefulWidget {
  const DocumentCompany({super.key});

  @override
  State<DocumentCompany> createState() => _DocumentCompanyState();
}

class _DocumentCompanyState extends State<DocumentCompany> {
  final controller = Get.put(DocumentCompanyController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filePickerSection(
            title: 'NIB',
            description:
            'Upload your NIB for company verification and to increase candidate trust. This document will not be displayed to candidates. (PDF, max. 3MB)',
            fileRx: controller.nibFile,
            timeRx: controller.nibUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'NPWP',
            description:
            'Upload your NPWP (Taxpayer Identification Number) to assist with company verification. This document is used for internal verification purposes only.(PDF, max. 3MB)',
            fileRx: controller.npwpFile,
            timeRx: controller.npwpUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'SKU/IUMK',
            description:
            'Upload your SKU/IUMK as proof of your business\'s legality (optional for MSMEs). This document is for internal verification purposes only. (PDF, max. 3MB)',
            fileRx: controller.skuFile,
            timeRx: controller.skuUploadedAt,
          ),
          _hGap20,
          _filePickerSection(
            title: 'Recruiter Identity',
            description:
            'Upload your PIC/HR ID to ensure the job posting is from a valid person in charge. This data is secure and will not be displayed to candidates. (PDF, max. 3MB)',
            fileRx: controller.recruiterIdFile,
            timeRx: controller.recruiterIdUploadedAt,
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
