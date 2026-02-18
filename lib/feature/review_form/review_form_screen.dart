part of '../../pages.dart';

class ReviewForm extends StatelessWidget {
  ReviewForm({super.key});

  final ReviewFormController controller = Get.put(ReviewFormController());

  static const _horizontalPadding = EdgeInsets.fromLTRB(20, 20, 20, 10);

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
        bottom: false,
        child: SingleChildScrollView(
          child: controller.role == 'company'
              ? _buildCompanyReview()
              : _buildCandidateReview(),
        ),
      ),
      bottomNavigationBar: ButtonCustom(
        onPressed: controller.role == 'company'
            ? () {
          debugPrint('SUBMIT COMPANY');
        } : () {
          debugPrint('SUBMIT CANDIDATE');},
        child: Container(
          alignment: Alignment.center,
          height: 45,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 30,
            top: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: orange,
          ),
          child: Text(
            'Submit',
            style: Poppins(
              fontSize: 13,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ================= COMMON HEADER =================

  Widget _buildIntro() {
    return Padding(
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
    );
  }

  // ================= COMPANY =================

  Widget _buildCompanyReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntro(),
        _hGap20,
        _SectionHeader(title: 'Company Information'),
        Padding(
          padding: _horizontalPadding,
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
        Padding(
          padding: _horizontalPadding,
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

  // ================= CANDIDATE =================

  Widget _buildCandidateReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntro(),
        _hGap20,
        _SectionHeader(title: 'Personal Data Information'),
        Padding(
          padding: _horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TwoCol(
                left: const [
                  _LabelText(label: 'Candidate Name', value: 'Pendekar Gendut'),
                  _LabelText(label: 'Gender', value: 'Female'),
                  _LabelText(label: 'School/University Name', value: 'ISTN'),
                  _LabelText(label: 'Last Education', value: 'Strata 1'),
                  _LabelText(label: 'Subdistrict', value: 'Jagakarsa'),
                  _LabelText(label: 'LinkedIn', value: 'Akhdan Habibie'),
                ],
                right: const [
                  _LabelText(label: 'Phone Number', value: '081290763984'),
                  _LabelText(label: 'Date of Birth', value: '24-04-1998'),
                  _LabelText(label: 'Major', value: 'Teknik Informatika'),
                  _LabelText(label: 'City', value: 'Jakarta'),
                  _LabelText(label: 'Github', value: 'akhdan1998'),
                ],
              ),
              _hGap20,
              _buildSectionWithChips('Skill', [
                'Communication',
                'Adaptability',
                'Leadership',
                'Product Thinking',
                'Problem Solving',
                'Microsoft Office',
                'Ownership & Accountability',
                'Time Management',
              ]),
              _hGap20,
              _buildSectionWithChips('Language', [
                'Indonesia',
                'English',
                'Arabic',
                'Mandarin',
                'Korean',
                'Japanese',
                'Spanich',
              ]),
            ],
          ),
        ),
        _SectionHeader(title: 'Experience'),
        Padding(
          padding: _horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TwoCol(
                left: const [_LabelText(label: 'Work Since', value: '2016')],
                right: const [
                  _LabelText(
                    label: 'Your Current Sitiuation',
                    value: 'In dire need of a job',
                  ),
                ],
              ),
              _hGap20,
              _experienceCard(),
              _hGap20,
              _experienceCard(),
            ],
          ),
        ),
        _SectionHeader(title: 'Document'),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              DocumentItem(
                title: 'CV',
                fileName: 'CV.pdf',
                addedText: 'Added 4 days ago',
              ),
              _hGap20,
              DocumentItem(
                title: 'Experience Letter',
                fileName: 'Experience Letter.pdf',
                addedText: 'Added 16 days ago',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= REUSABLE =================

  Widget _buildSectionWithChips(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Poppins(color: black, fontSize: 13)),
        _hGap10,
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: items
              .map(
                (e) => Chip(
                  label: Text(e, style: Poppins(color: orange, fontSize: 10)),
                  shape: StadiumBorder(
                    side: BorderSide(color: grey, width: 1.2),
                  ),
                  backgroundColor: white,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _experienceCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.2, color: grey),
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waiter',
            style: Poppins(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          _hGap10,
          Text('Kopi Nako', style: Poppins(fontSize: 13)),
          Text(
            'Nov 2022 - Oct 2025 (1 year 2 months)',
            style: Poppins(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
