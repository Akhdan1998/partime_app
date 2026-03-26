part of '../../pages.dart';

class Vacancy extends StatefulWidget {
  const Vacancy({super.key});

  @override
  State<Vacancy> createState() => _VacancyState();
}

class _VacancyState extends State<Vacancy> {
  final VacancyController controller = Get.put(VacancyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Obx(
          () => controller.isCompany
              ? const _CandidateHome()
              : const _CompanyHome(),
        ),
      ),
    );
  }
}

class _CompanyHome extends StatelessWidget {
  const _CompanyHome();

  static const List<_TopMenuData> _menus = [
    _TopMenuData(icon: Icons.folder_open_outlined, label: 'Document'),
    _TopMenuData(icon: Icons.work_outline, label: 'Vacancies'),
    _TopMenuData(icon: Icons.groups_outlined, label: 'Applicants'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CurvedHeader(
              height: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _hGap50,
                  Text(
                    'Find your job\nfavorite here!',
                    style: Poppins(
                      color: white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _hGap20,
                  TextFieldCustom(
                    hintText: 'Search',
                    hintColor: grey,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showReusableBottomSheet(
                          context: context,
                          child: Sort(),
                        );
                      },
                      child: Icon(Icons.sort, color: orange),
                    ),
                    prefixIcon: Icon(Icons.search, color: orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: white,
                padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    _JobCard(
                      title: 'Waiter',
                      price: 'Rp. 150,000,- /day',
                      company: 'Kopitagram',
                      location: 'Ampera Jakarta • 19 km',
                      schedule:
                          'Required on July 29 to July 31, 2025 (2 days, per day from 3:00 PM - 10:00 PM)',
                      rating: 3,
                      verified: true,
                      tags: ['Team Work', 'Part Time', 'Leadership'],
                    ),
                    _hGap20,
                    _buildDivider(context, color: grey),
                    _hGap20,
                    _JobCard(
                      title: 'Admin',
                      price: 'Rp. 53,000 /hour',
                      company: 'PT. Arkana Dwi Mutiara',
                      location: 'Ampera Raya • 7 km',
                      schedule:
                          'Required on January 30th from 08:00 AM - 17:00 PM (8 hours)',
                      rating: 5,
                      verified: false,
                      tags: ['Leadership', 'Team Work', 'Part Time'],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 250,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TopMenuCard(data: _menus[0]),
              _TopMenuCard(data: _menus[1]),
              _TopMenuCard(data: _menus[2]),
            ],
          ),
        ),
      ],
    );
  }
}

class _CandidateHome extends StatelessWidget {
  const _CandidateHome();

  static const List<_TopMenuData> _menus = [
    _TopMenuData(icon: Icons.pending_actions_outlined, label: 'In Review'),
    _TopMenuData(icon: Icons.verified_outlined, label: 'Active'),
    _TopMenuData(icon: Icons.highlight_off_outlined, label: 'NonActive'),
    _TopMenuData(icon: Icons.schedule_outlined, label: 'Expired'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CurvedHeader(
              height: 390,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _hGap50,
                  Text(
                    'Manage your\nVacancies here!',
                    style: Poppins(
                      color: white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _hGap20,
                  ButtonCustom(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.2, color: white),
                        borderRadius: BorderRadius.circular(50),
                        color: white.withOpacity(0.2),
                      ),
                      child: Text(
                        'Create Vacancies',
                        style: Poppins(fontSize: 13, color: white),
                      ),
                    ),
                  ),
                  _hGap20,
                  TextFieldCustom(
                    fillColor: white.withOpacity(0.2),
                    hintText: 'Search',
                    hintColor: white,
                    enabledBorderSide: BorderSide(width: 1.2, color: white),
                    focusedBorderSide: BorderSide(width: 1.2, color: white),
                    borderSide: BorderSide(width: 1.2, color: white),
                    errorBorderSide: BorderSide(width: 1.2, color: red),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showReusableBottomSheet(
                          context: context,
                          child: Sort(),
                        );
                      },
                      child: Icon(Icons.sort, color: white),
                    ),
                    prefixIcon: Icon(Icons.search, color: white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonCustom(
                      onPressed: () {
                        Get.to(
                              () => const VacancyDetail(),
                          arguments: {
                            'role': 'candidate',
                            'view': 'candidate',
                          },
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 2,
                              color: grey.withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 300,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TopMenuCard(data: _menus[0]),
              _TopMenuCard(data: _menus[1]),
              _TopMenuCard(data: _menus[2]),
              _TopMenuCard(data: _menus[3]),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopMenuCard extends StatelessWidget {
  final _TopMenuData data;

  const _TopMenuCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: () {},
      child: Container(
        height: 90,
        width: 81,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.25),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(shape: BoxShape.circle, color: orange),
              child: Icon(data.icon, color: white, size: 20),
            ),
            _hGap10,
            Text(
              data.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Poppins(fontWeight: FontWeight.w500, fontSize: 11.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final String title;
  final String price;
  final String company;
  final String location;
  final String schedule;
  final int rating;
  final bool verified;
  final List<String> tags;

  const _JobCard({
    required this.title,
    required this.price,
    required this.company,
    required this.location,
    required this.schedule,
    required this.rating,
    required this.verified,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: () {
        Get.to(
              () => const VacancyDetail(),
          arguments: {
            'role': 'company',
            'view': 'company',
          },
        );
      },
      child: Container(
        color: transparentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Poppins(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Text(
                  price,
                  style: Poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: orange,
                  ),
                ),
              ],
            ),
            _hGap5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(company, style: Poppins(fontSize: 12)),
                    if (verified) ...[
                      _wGap5,
                      Icon(Icons.check_circle, color: green, size: 12),
                    ],
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 13),
                    _wGap5,
                    Text(location, style: Poppins(fontSize: 12)),
                  ],
                ),
              ],
            ),
            _hGap5,
            Text(schedule, style: Poppins(fontSize: 10, color: grey)),
            _hGap5,
            _RatingStars(rating: rating),
            _hGap5,
            Row(
              children: tags
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _TagChip(label: tag),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: grey.withOpacity(0.3),
      ),
      child: Text(label, style: Poppins(color: orange, fontSize: 8)),
    );
  }
}