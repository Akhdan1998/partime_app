part of '../../../../../pages.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final controller = Get.put(ExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextField(
              keyboardType: TextInputType.number,
              label: 'Working since',
              hintText: '',
              controller: controller.workingSince,
            ),
            _hGap20,
            Obx(() {
              return ReusableExpansionTile<CurrentSituation>(
                trailingColor: grey,
                textColor: black,
                borderColor: grey,
                dividerColor: grey,
                title:
                    controller
                        .selectedCurrentSituation
                        .value
                        ?.currentSituation ??
                    "Current Situation",
                titleAlignment: Alignment.centerLeft,
                fontSize: 12,
                items: controller.currentSituation,
                closeOnSelect: true,
                initialSelectedItem: controller.selectedCurrentSituation.value,
                onExpansionChanged: (_) {},
                onItemPressed: (item) {
                  controller.selectedCurrentSituation.value = item;
                },
                itemBuilder: (item, isSelected) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      item.currentSituation,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Work Experience/Internship',
                  style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                ButtonCustom(
                  onPressed: () {
                    Get.to(WorkExperience());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: orange,
                    ),
                    child: Icon(Icons.add, color: white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
