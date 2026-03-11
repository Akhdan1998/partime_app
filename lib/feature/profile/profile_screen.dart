part of '../../pages.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.role});

  final String role;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final ProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      ProfileController(role: widget.role),
      tag: widget.role,
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<ProfileController>(tag: widget.role)) {
      Get.delete<ProfileController>(tag: widget.role);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = controller.profileData;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            _ProfileHeader(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TopCurveContainer(
                height: MediaQuery.of(context).size.height - 160,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.name,
                        style: Poppins(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      _hGap10,
                      Text(
                        data.email,
                        style: Poppins(color: grey),
                        textAlign: TextAlign.center,
                      ),
                      _hGap20,
                      _StatsCard(stats: data.stats),
                      _hGap20,
                      ...List.generate(data.menus.length, (index) {
                        final menu = data.menus[index];
                        final isLast = index == data.menus.length - 1;

                        return Column(
                          children: [
                            _ProfileMenuTile(
                              title: menu.title,
                              subtitle: menu.subtitle,
                              onTap: menu.onTap,
                            ),
                            if (!isLast)
                              _buildDivider(
                                context,
                                color: grey,
                                indent: 20,
                                endIndent: 20,
                              ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 100,
              right: 100,
              child: Obx(
                () => CusImagePicker(
                  iconBackground: orange,
                  imageFile: controller.imageFile.value,
                  onTap: controller.pickImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(gradient: AppGradients.orangeGradient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonCustom(
            onPressed: () {},
            child: Icon(Icons.settings, color: transparentColor),
          ),
          Text(
            'Profile',
            style: Poppins(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          ButtonCustom(
            onPressed: () {},
            child: Icon(Icons.settings, color: white),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.stats});

  final List<ProfileStat> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(stats.length, (index) {
          final stat = stats[index];
          final isLast = index == stats.length - 1;

          return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        stat.value,
                        style: Poppins(fontWeight: FontWeight.bold),
                      ),
                      _hGap10,
                      Text(
                        stat.label,
                        style: Poppins(color: stat.color, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                if (!isLast) _vDivider(color: grey),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        color: transparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Poppins(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  _hGap5,
                  Text(subtitle, style: Poppins(fontSize: 11, color: grey)),
                ],
              ),
            ),
            _wGap10,
            Icon(Icons.arrow_forward_ios, size: 14, color: grey),
          ],
        ),
      ),
    );
  }
}
