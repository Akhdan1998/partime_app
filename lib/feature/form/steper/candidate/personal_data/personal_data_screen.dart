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
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextField(
              label: 'Candidate Name',
              hintText: 'Pendekar Gendut',
            ),
            _hGap20,
            Obx(() {
              return ReusableExpansionTile<Gender>(
                trailingColor: grey,
                textColor: black,
                borderColor: grey,
                dividerColor: grey,
                title: controller.selectedGender.value?.gender ?? "Gender",
                titleAlignment: Alignment.centerLeft,
                fontSize: 12,
                items: controller.gender,
                // enableSearch: true,
                // searchKey: (item) => item.gender,
                closeOnSelect: true,
                initialSelectedItem: controller.selectedGender.value,
                onExpansionChanged: (_) {},
                onItemPressed: (item) {
                  controller.selectedGender.value = item;
                },
                itemBuilder: (item, isSelected) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      item.gender,
                      style: Poppins(
                        color: isSelected ? orange : grey,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                },
              );
            }),
            _hGap20,
            LabeledTextField(label: 'Phone Number', hintText: '081290763984'),
            _hGap20,
            LabeledTextField(label: 'Date of birth', hintText: '24-03-1998'),
            _hGap20,
            LabeledTextField(
              label: 'School/University Name',
              hintText: 'Institut Sains & Teknologi Nasional',
            ),
            _hGap20,
            LabeledTextField(label: 'Major', hintText: 'Teknik Informatika'),
            _hGap20,
            LabeledTextField(label: 'Last Education', hintText: 'Strata 1'),
            _hGap20,
            LabeledTextField(
              label: 'Recruiter Name',
              hintText: 'Kesatria Gelembung',
            ),
            _hGap20,
            LabeledTextField(label: 'City', hintText: 'Jakarta'),
            _hGap20,
            LabeledTextField(label: 'Subdistrict', hintText: 'Jagakarsa'),
            _hGap20,
            LabeledTextField(
              label: 'LinkedIn (Optional)',
              hintText: 'Pendekar Gendut',
            ),
            _hGap20,
            LabeledTextField(
              label: 'Github (Optional)',
              hintText: 'Akhdan1998',
            ),
            _hGap20,
            Text(
              'Soft Skills',
              style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            _hGap10,
            _TwoCol(
              left: [
                _LabelValue(value: 'Communication'),
                _LabelValue(value: 'Problem Solving'),
                _LabelValue(value: 'Critical Thinking'),
                _LabelValue(value: 'Adaptability'),
                _LabelValue(value: 'Decision Making'),
                _LabelValue(value: 'Conflict Resolution'),
                _LabelValue(value: 'Stakeholder Communication'),
              ],
              right: [
                _LabelValue(value: 'Team Collaboration'),
                _LabelValue(value: 'Time Management'),
                _LabelValue(value: 'Leadership'),
                _LabelValue(value: 'Negotiation'),
                _LabelValue(value: 'Ownership & Accountability'),
                _LabelValue(value: 'Emotional Intelligence'),
              ],
            ),

            _hGap20,
            Text(
              'Languages',
              style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            _hGap10,
            _TwoCol(
              left: [
                _LabelValue(value: 'Indonesian'),
                _LabelValue(value: 'English'),
                _LabelValue(value: 'Mandarin'),
                _LabelValue(value: 'Arabic'),
              ],
              right: [
                _LabelValue(value: 'Korean'),
                _LabelValue(value: 'Japanese'),
                _LabelValue(value: 'French'),
                _LabelValue(value: 'Spanish'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
