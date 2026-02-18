part of '../../pages.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final ReviewFormController controller = Get.put(ReviewFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(
        title: 'Review',
        showBackButton: false,
        showMoreButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: controller.role == 'company'
              ? _buildCompanyReview()
              : _buildCandidateReview(),
        ),
      ),
    );
  }

  Widget _buildCompanyReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review Your Data',
                style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              _hGap10,
              Text(
                'Is the information you submitted correct?',
                style: Poppins(fontSize: 12),
              ),
            ],
          ),
        ),
        _hGap20,
        _SectionHeader(title: 'Company Information'),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: _TwoCol(
            left: const [
              _LabelText(
                label: 'Recruitment Name',
                value: 'Kesatria Gelembung',
              ),
              _LabelText(label: 'Company name', value: 'PT. Kodok Buya'),
              _LabelText(
                label: 'Office Location',
                value: 'Kemayoran, Jakarta Utara',
              ),
              _LabelText(label: 'Company Website', value: 'www.kodokbuya.com'),
              _LabelText(label: 'Description', value: '-'),
            ],
            right: const [
              _LabelText(label: 'Recruiter Job Position', value: 'HR'),
              _LabelText(label: 'Corporate Business', value: '-'),
              _LabelText(label: 'Current Total Employees', value: '32'),
              _LabelText(label: 'LinkedIn', value: 'Company'),
              _LabelText(
                label: 'Link Maps',
                value: 'maps.app.goo.gl/3L8JkqvZKqtwYmns9',
              ),
            ],
          ),
        ),
        _SectionHeader(title: 'Job Details'),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: _TwoCol(
            left: const [
              _LabelText(label: 'Job Category', value: 'Administration & HRD'),
              _LabelText(label: 'Vacancies Available', value: '3'),
              _LabelText(label: 'Gender', value: 'Unisex'),
              _LabelText(label: 'Employment Policy', value: 'On-Site'),
              _LabelText(label: 'Assets', value: '- Smartphone\n- Motor'),
              _LabelText(label: 'Qualifications', value: '-'),
            ],
            right: const [
              _LabelText(label: 'Field of work', value: 'Administrative'),
              _LabelText(label: 'Age', value: '18-26'),
              _LabelText(
                label: 'Minimum Education',
                value: 'Junior High School',
              ),
              _LabelText(label: 'Wages', value: 'Rp. 150.000 ,-'),
              _LabelText(label: 'Working time', value: '08:00 : 17:00'),
              _LabelText(label: 'Job description', value: '-'),
            ],
          ),
        ),
        _SectionHeader(title: 'Document'),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              DocumentItem(
                title: 'NPWP',
                fileName: 'NPWP.pdf',
                addedText: 'Added 31 days ago',
              ),
              _hGap20,
              DocumentItem(
                title: 'SKU/IUMK',
                fileName: 'SKU/IUMK.pdf',
                addedText: 'Added 26 days ago',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCandidateReview() {
    return const Center(child: Text('Review Candidate'));
  }
}
