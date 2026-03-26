part of '../../pages.dart';

class UpdateDocument extends StatefulWidget {
  const UpdateDocument({super.key, required this.role});

  final String role;

  @override
  State<UpdateDocument> createState() => _UpdateDocumentState();
}

class _UpdateDocumentState extends State<UpdateDocument> {
  late final UpdateDocumentController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      UpdateDocumentController(role: widget.role),
      tag: widget.role,
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<UpdateDocumentController>(tag: widget.role)) {
      Get.delete<UpdateDocumentController>(tag: widget.role);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(
        title: controller.isCompany ? 'Company Document' : 'Document',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: controller.isCompany
              ? _buildCompanyDocument()
              : _buildCandidateDocument(),
        ),
      ),
    );
  }

  Widget _buildCompanyDocument() {
    return Column(
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
              'Upload your NPWP (Taxpayer Identification Number) to assist with company verification. This document is used for internal verification purposes only. (PDF, max. 3MB)',
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
    );
  }

  Widget _buildCandidateDocument() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _filePickerSection(
          title: 'Portfolio',
          description:
              'Upload a portfolio to strengthen your application. You can change it at any time, and you can attach this file to your application. (PDF, max. 3MB)',
          fileRx: controller.portfolioFile,
          timeRx: controller.portfolioUploadedAt,
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
                    onPressed: () => controller.pickFile(fileRx, timeRx),
                    child: Container(
                      alignment: Alignment.center,
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orange,
                      ),
                      child: Icon(
                        file == null ? Icons.add : Icons.check,
                        color: white,
                        size: 20,
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
