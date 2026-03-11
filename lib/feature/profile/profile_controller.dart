part of '../../pages.dart';

class ProfileController extends GetxController {
  ProfileController({required this.role});

  final String role;
  final Rxn<File> imageFile = Rxn<File>();
  final ImagePicker picker = ImagePicker();

  bool get isCompany => role == 'company';

  ProfileData get profileData => isCompany
      ? ProfileData(
          name: 'Pendekar Gendut',
          email: 'pendekargendut@gmail.com',
          stats: [
            ProfileStat(value: '203', label: 'Proposed', color: orange),
            ProfileStat(value: '10', label: 'Saved', color: green),
            ProfileStat(value: '90', label: 'Processed', color: blue),
            ProfileStat(value: '105', label: 'Rejected', color: red),
          ],
          menus: [
            ProfileMenuData(
              title: 'My Profile',
              subtitle: 'Manage personal data in an agile and seamless way.',
              onTap: () {},
            ),
            ProfileMenuData(
              title: 'Document',
              subtitle: 'One step closer to the next big opportunity.',
              onTap: () {},
            ),
            ProfileMenuData(
              title: 'Log Out',
              subtitle: 'Go out first, then come back with a fresh mindset.',
              onTap: () {},
            ),
          ],
        )
      : ProfileData(
          name: 'PT. Kolink Network Solutions',
          email: 'develop@kolink.net',
          stats: [
            ProfileStat(value: '193', label: 'Rejected', color: orange),
            ProfileStat(value: '76', label: 'Invited', color: green),
            ProfileStat(value: '54', label: 'Reviewed', color: blue),
            ProfileStat(value: '345', label: 'Expired', color: red),
          ],
          menus: [
            ProfileMenuData(
              title: 'My Company',
              subtitle: 'Manage personal data in an agile and seamless way.',
              onTap: () {},
            ),
            ProfileMenuData(
              title: 'Document',
              subtitle: 'One step closer to the next big opportunity.',
              onTap: () {},
            ),
            ProfileMenuData(
              title: 'Log Out',
              subtitle: 'Go out first, then come back with a fresh mindset.',
              onTap: () {},
            ),
          ],
        );

  Future<void> pickImage() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      imageFile.value = File(pickedImage.path);
    }
  }
}

class ProfileData {
  final String name;
  final String email;
  final List<ProfileStat> stats;
  final List<ProfileMenuData> menus;

  ProfileData({
    required this.name,
    required this.email,
    required this.stats,
    required this.menus,
  });
}

class ProfileStat {
  final String value;
  final String label;
  final Color color;

  const ProfileStat({
    required this.value,
    required this.label,
    required this.color,
  });
}

class ProfileMenuData {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ProfileMenuData({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}