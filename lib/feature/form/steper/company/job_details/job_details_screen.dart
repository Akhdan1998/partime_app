part of '../../../../../pages.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final controller = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  controller.selectedJobField.value?.name ?? "Field of work",
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
                          style: Poppins(color: isSelected ? orange : grey),
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
            label: 'Work Experience (Optional)',
            hintText: '3',
            controller: controller.workExperience,
            suffixIcon: Text('/years', style: Poppins(color: grey)),
          ),
          _hGap20,
          LabeledTextField(
            label: 'Vacancies Available (Optional)',
            hintText: '8',
            controller: controller.vacanciesAvailable,
          ),
          _hGap20,
          Text(
            'Age',
            style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          _hGap10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldCustom(
                  hintText: 'From',
                  borderRadius: 50,
                  controller: controller.from,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
              _wGap20,
              Expanded(
                child: TextFieldCustom(
                  hintText: 'To',
                  borderRadius: 50,
                  controller: controller.to,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
            ],
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
          Obx(() {
            return ReusableExpansionTile<MinimumEducation>(
              trailingColor: grey,
              textColor: black,
              borderColor: grey,
              dividerColor: grey,
              title:
                  controller.selectedMinEducation.value?.minEducation ??
                  "Minimal Education",
              titleAlignment: Alignment.centerLeft,
              fontSize: 12,
              items: controller.minEducation,
              enableSearch: true,
              searchKey: (item) => item.minEducation,
              closeOnSelect: true,
              initialSelectedItem: controller.selectedMinEducation.value,
              onExpansionChanged: (_) {},
              onItemPressed: (item) {
                controller.selectedMinEducation.value = item;
              },
              itemBuilder: (item, isSelected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Text(
                    item.minEducation,
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
            return ReusableExpansionTile<EmploymentPolicy>(
              trailingColor: grey,
              textColor: black,
              borderColor: grey,
              dividerColor: grey,
              title:
                  controller.selectedEmploymentPolicy.value?.employmentPolicy ??
                  "Employment Policy",
              titleAlignment: Alignment.centerLeft,
              fontSize: 12,
              items: controller.employmentPolicy,
              enableSearch: true,
              searchKey: (item) => item.employmentPolicy,
              closeOnSelect: true,
              initialSelectedItem: controller.selectedEmploymentPolicy.value,
              onExpansionChanged: (_) {},
              onItemPressed: (item) {
                controller.selectedEmploymentPolicy.value = item;
              },
              itemBuilder: (item, isSelected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Text(
                    item.employmentPolicy,
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
          Text(
            'Wages',
            style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          _hGap10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldCustom(
                  hintText: 'Rp. 150.000.-',
                  borderRadius: 50,
                  controller: controller.from,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
              _wGap20,
              ButtonCustom(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.2, color: grey),
                    shape: BoxShape.circle,
                    color: white,
                  ),
                  child: Icon(Icons.filter_list, size: 20, color: grey),
                ),
              ),
            ],
          ),
          _hGap20,
          LabeledTextField(
            label: 'Qualifications / Requirements',
            hintText: '',
            controller: controller.qualifications,
          ),
          _hGap20,
          LabeledTextField(
            label: 'Job description',
            hintText: '',
            controller: controller.jobDescription,
          ),
          _hGap20,
          Text(
            'Working days',
            style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          _hGap10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldCustom(
                  hintText: 'From',
                  borderRadius: 50,
                  controller: controller.from,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
              _wGap20,
              Expanded(
                child: TextFieldCustom(
                  hintText: 'To',
                  borderRadius: 50,
                  controller: controller.to,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
            ],
          ),
          _hGap20,
          Text(
            'Working time',
            style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          _hGap10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldCustom(
                  hintText: 'From',
                  borderRadius: 50,
                  controller: controller.from,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
              _wGap20,
              Expanded(
                child: TextFieldCustom(
                  hintText: 'To',
                  borderRadius: 50,
                  controller: controller.to,
                  keyboardType: TextInputType.number,
                  focusedBorderSide: BorderSide(color: grey, width: 1.2),
                  enabledBorderSide: BorderSide(color: grey, width: 1.2),
                ),
              ),
            ],
          ),
          _hGap20,
          Text(
            'Select the assets you own to support your work. (Optional)',
            style: Poppins(fontWeight: FontWeight.w500, fontSize: 13,),
          ),
          _hGap10,
          _TwoCol(
            left: [
              _LabelValue(value: 'Laptop'),
              _LabelValue(value: 'Smartphone'),
              _LabelValue(value: 'Tablet'),
            ],
            right: [
              _LabelValue(value: 'Motor'),
              _LabelValue(value: 'Car'),
              _LabelValue(value: 'Camera'),
            ],
          ),
          _hGap20,
        ],
      ),
    );
  }
}
