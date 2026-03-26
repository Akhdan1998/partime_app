part of '../../pages.dart';

class VacancyDetail extends StatefulWidget {
  const VacancyDetail({super.key});

  @override
  State<VacancyDetail> createState() => _VacancyDetailState();
}

class _VacancyDetailState extends State<VacancyDetail> {
  final VacancyDetailController controller = Get.put(VacancyDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(title: 'Kopitagram'),
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: controller.isCompany
                ? const _CandidateVacancyDetailView()
                : const _CompanyVacancyDetailView(),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () => SafeArea(
          top: false,
          child: controller.isCompany
              ? ButtonCustom(
            onPressed: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: orange,
              ),
              child: Text(
                'Apply',
                style: Poppins(
                  fontSize: 13,
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
              : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonCustom(
                onPressed: () {},
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: white,
                    border: Border.all(width: 1.2, color: orange),
                  ),
                  child: Text(
                    'Change Job Vacancy',
                    style: Poppins(
                      fontSize: 13,
                      color: orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ButtonCustom(
                onPressed: () {},
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    // bottom: 20,
                  ),
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: orange,
                  ),
                  child: Text(
                    'View Applicant List',
                    style: Poppins(
                      fontSize: 13,
                      color: white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompanyVacancyDetailView extends StatelessWidget {
  const _CompanyVacancyDetailView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _hGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: _IconInfoText(
                icon: Icons.attach_money,
                text: 'Rp. 100,000 /day',
              ),
            ),
            _wGap10,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.end,
              children: [
                _StatusChip(label: 'Active', color: green),
                _StatusChip(label: '23 Applicants', color: orange),
              ],
            ),
          ],
        ),
        _hGap10,
        const _IconInfoText(
          icon: Icons.work_outline,
          text: '2 Nov - 8 Nov 2026 • On-Site • 1/2 vacancy',
        ),
        _hGap10,
        const _MultiLineInfo(
          icon: Icons.location_on_outlined,
          title: 'Unisex • 18 - 27 years',
          subtitle: 'Published on 07 Oktober 2026',
        ),
        _hGap10,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(width: 1.2, color: orange),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const _RequirementGrid(),
        ),
        _hGap15,
        _SectionTitle(title: 'Qualifications / Requirements'),
        _hGap5,
        const _BulletTextList(
          items: [
            'Active student in any major',
            'Able to work at least 3 days per week',
            'Design experience is a plus',
          ],
        ),
        _hGap15,
        _SectionTitle(title: 'Job description'),
        _hGap5,
        const _BulletTextList(
          items: [
            'Welcoming & Directing Guests',
            'Explaining & Recommending Menu Items',
            'Taking Orders',
            'Serving Orders',
            'Service During Meals',
            'Checking Satisfaction & Handling Complaints',
            'Managing Payments',
            'Maintaining Cleanliness',
          ],
        ),
        _hGap20,
      ],
    );
  }
}

class _CandidateVacancyDetailView extends StatelessWidget {
  const _CandidateVacancyDetailView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _hGap20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Waiter',
                style: Poppins(fontWeight: FontWeight.w600),
              ),
            ),
            _wGap10,
            _StatusChip(label: 'Verified Company', color: green),
          ],
        ),
        _hGap10,
        const _IconInfoText(icon: Icons.attach_money, text: 'Rp. 100,000 /day'),
        _hGap10,
        const _IconInfoText(
          icon: Icons.work_outline,
          text: '2 Nov - 8 Nov 2026 • Part Time • 1/2 vacancy',
        ),
        _hGap10,
        const _MultiLineInfo(
          icon: Icons.location_on_outlined,
          title:
              'Jl. Ampera Raya No.129A, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12560 • 17 km',
          subtitle:
              'Published on 07/18/2025, by Recruiter Team (Kesatria Gelembung)',
        ),
        _hGap10,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: AppGradients.orangeGradient,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                child: Icon(Icons.image_outlined, color: orange, size: 20),
              ),
              _wGap15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kesatria Gelembung',
                    style: Poppins(color: white, fontSize: 12),
                  ),
                  Text(
                    'Recruitment Team • Tanatap Coffee Company',
                    style: Poppins(color: white, fontSize: 11),
                  ),
                  _hGap5,
                  _RatingStars(rating: 4),
                ],
              ),
            ],
          ),
        ),
        _hGap15,
        _SectionTitle(title: 'Job description'),
        _hGap5,
        const _BulletTextList(
          items: [
            'Welcoming & Directing Guests',
            'Explaining & Recommending Menu Items',
            'Taking Orders',
            'Serving Orders',
            'Service During Meals',
            'Checking Satisfaction & Handling Complaints',
            'Managing Payments',
            'Maintaining Cleanliness',
          ],
        ),
        _hGap15,
        const _RequirementGrid(),
        _hGap20,
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Poppins(fontWeight: FontWeight.w400, fontSize: 13),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: color,
      ),
      child: Text(label, style: Poppins(color: white, fontSize: 10)),
    );
  }
}

class _IconInfoText extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconInfoText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: orange, size: 18),
        _wGap5,
        Expanded(child: Text(text, style: Poppins(fontSize: 13))),
      ],
    );
  }
}

class _MultiLineInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MultiLineInfo({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: orange, size: 18),
        _wGap5,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Poppins(fontSize: 13)),
              _hGap10,
              Text(subtitle, style: Poppins(fontSize: 10, color: grey)),
            ],
          ),
        ),
      ],
    );
  }
}

class _BulletTextList extends StatelessWidget {
  final List<String> items;

  const _BulletTextList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                ' • $e',
                style: Poppins(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _RequirementGrid extends StatelessWidget {
  const _RequirementGrid();

  @override
  Widget build(BuildContext context) {
    return _TwoCol(
      left: [
        _InfoMiniSection(
          icon: Icons.work_outline,
          title: 'Work experience',
          value: '-',
        ),
        _hGap15,
        _InfoMiniSection(
          icon: Icons.web_asset_sharp,
          title: 'Asset',
          value: 'Motorcycles, Smartphones',
        ),
      ],
      right: [
        _InfoMiniSection(
          icon: Icons.school_outlined,
          title: 'Education',
          value: 'Minimum junior high school',
        ),
        _hGap15,
        _InfoMiniSection(
          icon: Icons.lightbulb_outline,
          title: 'Skill',
          value: 'Teamwork, leader',
        ),
      ],
    );
  }
}

class _InfoMiniSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoMiniSection({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: orange, size: 15),
            _wGap10,
            Expanded(
              child: Text(
                title,
                style: Poppins(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        _hGap5,
        Text(value, style: Poppins(fontSize: 10)),
      ],
    );
  }
}