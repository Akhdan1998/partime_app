part of '../../../../../pages.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final controller = Get.put(PersonalDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Personal Data')));
  }
}
