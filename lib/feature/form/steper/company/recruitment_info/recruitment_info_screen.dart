part of '../../../../../pages.dart';

class RecruitmentInfo extends StatefulWidget {
  const RecruitmentInfo({super.key});

  @override
  State<RecruitmentInfo> createState() => _RecruitmentInfoState();
}

class _RecruitmentInfoState extends State<RecruitmentInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LabeledTextField(
            label: 'Recruiter Name',
            hintText: 'Kesatria Gelembung',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Recruiter Job Position',
            hintText: 'HR',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Company name',
            hintText: 'Toko H Haris',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Office Location',
            hintText: 'Kemayoran, Jakarta Utara',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Link Maps',
            hintText:
            'https://maps.app.goo.gl/3L8JkqvZKqtwYmns9',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Current Total Employees',
            hintText: '32',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Company Website',
            hintText: 'www.kodokbuya.com',
          ),
          _hGap20,
          LabeledTextField(
            label: 'Description (Optional)',
            hintText: '-',
          ),
          _hGap20,
          LabeledTextField(
            label: 'LinkedIn (Optional)',
            hintText: '-',
          ),
        ],
      ),
    );
  }
}
