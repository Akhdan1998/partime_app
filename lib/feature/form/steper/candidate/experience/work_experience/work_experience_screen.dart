part of '../../../../../../pages.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final controller = Get.put(WorkExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(
        title: 'Add Work Experience',
        showBackButton: true,
        showMoreButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return ReusableExpansionTile<JobCategory>(
                    trailingColor: grey,
                    textColor: black,
                    borderColor: grey,
                    dividerColor: grey,
                    title:
                        controller.selectedCategory.value?.name ??
                        "Job Category",
                    titleAlignment: Alignment.centerLeft,
                    fontSize: 12,
                    items: controller.jobCategories,
                    enableSearch: true,
                    searchKey: (item) => item.name,
                    closeOnSelect: true,
                    initialSelectedItem: controller.selectedCategory.value,
                    onExpansionChanged: (_) {},
                    onItemPressed: (item) {
                      controller.selectedCategory.value = item;
                      controller.selectedJobField.value = null;
                    },
                    itemBuilder: (item, isSelected) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Text(
                          item.name,
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
                Obx(() {
                  if (controller.selectedCategory.value == null) {
                    return const SizedBox();
                  }

                  return ReusableExpansionTile<JobField>(
                    trailingColor: grey,
                    textColor: black,
                    borderColor: grey,
                    dividerColor: grey,
                    title:
                        controller.selectedJobField.value?.name ??
                        "Field of work",
                    titleAlignment: Alignment.centerLeft,
                    fontSize: 12,
                    items: controller.filteredFields,
                    enableSearch: true,
                    searchKey: (item) => item.name,
                    closeOnSelect: true,
                    initialSelectedItem: controller.selectedJobField.value,
                    onExpansionChanged: (_) {},
                    onItemPressed: (item) {
                      controller.selectedJobField.value = item;
                    },
                    itemBuilder: (item, isSelected) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: Poppins(
                                  color: isSelected ? orange : grey,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check, color: orange, size: 16),
                          ],
                        ),
                      );
                    },
                  );
                }),
                _hGap20,
                LabeledTextField(
                  label: 'Company',
                  hintText: 'PT. Kolink Network Solutions',
                  controller: controller.companyName,
                ),
                _hGap20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: Poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          _hGap10,
                          TextFieldCustom(
                            hintText: 'Select Date',
                            borderRadius: 50,
                            controller: controller.startDate,
                            keyboardType: TextInputType.number,
                            focusedBorderSide: BorderSide(
                              color: grey,
                              width: 1.2,
                            ),
                            enabledBorderSide: BorderSide(
                              color: grey,
                              width: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _wGap20,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completion Date',
                            style: Poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          _hGap10,
                          TextFieldCustom(
                            hintText: 'Select Date',
                            borderRadius: 50,
                            controller: controller.completionDate,
                            keyboardType: TextInputType.number,
                            focusedBorderSide: BorderSide(
                              color: grey,
                              width: 1.2,
                            ),
                            enabledBorderSide: BorderSide(
                              color: grey,
                              width: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _hGap20,
                LabeledTextField(
                  label: 'Description (Optional)',
                  hintText:
                      'List the responsibilities, skills and achievements you have acquired.',
                  controller: controller.description,
                ),
                _hGap20,
                Obx(() => CusCheckbox(
                  value: controller.isChecked.value,
                  label: "This is an Internship Experience",
                  onChanged: (val) {
                    controller.isChecked.value = val;
                  },
                )),
                _hGap20,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
        child: ButtonCustom(
          onPressed: () {},
          child: Container(
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: orange,
            ),
            child: Text(
              'Login',
              style: Poppins(
                fontSize: 13,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
