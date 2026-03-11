part of '../../../pages.dart';

class Sort extends StatelessWidget {
  Sort({super.key});

  final SortController controller = Get.put(SortController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          _hGap20,
          Text(
            controller.isCompany
                ? 'Filter Vacancy / Applicants'
                : 'Filter Jobs',
            style: Poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          _hGap20,

          _buildSharedFilters(),

          if (controller.isCompany) ...[
            _hGap20,
            _buildCompanyFilters(),
          ] else ...[
            _hGap20,
            _buildCandidateFilters(),
          ],

          _hGap20,
          Row(
            children: [
              Expanded(
                child: ButtonCustom(
                  onPressed: controller.resetFilter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1.2, color: orange),
                      color: white,
                    ),
                    child: Text(
                      'Reset',
                      style: Poppins(
                        fontSize: 13,
                        color: orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              _wGap10,
              Expanded(
                child: ButtonCustom(
                  onPressed: () => Get.back(),
                  child: Container(
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
                ),
              ),
            ],
          ),
          _hGap20,
        ],
      );
    });
  }

  Widget _buildSharedFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: Poppins(fontSize: 13)),
        _hGap10,
        CusCheckbox(
          value: controller.isNearMe.value,
          label: "Near me",
          onChanged: controller.toggleNearMe,
        ),
        _hGap20,

        Text('Job Category', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<JobCategory>(
          title: controller.selectedCategory.value?.name ?? "Please select",
          items: controller.jobCategories,
          searchKey: (item) => item.name,
          initialSelectedItem: controller.selectedCategory.value,
          onItemPressed: (item) => controller.selectedCategory.value = item,
          itemLabel: (item) => item.name,
        ),

        _hGap20,
        Text('City', style: Poppins(fontSize: 13)),
        _hGap10,
        IgnorePointer(
          ignoring: controller.isNearMe.value,
          child: Opacity(
            opacity: controller.isNearMe.value ? 0.5 : 1,
            child: _buildOptionTile<City>(
              title: controller.selectedCity.value?.city ?? "Please select",
              items: controller.cities,
              searchKey: (item) => item.city,
              initialSelectedItem: controller.selectedCity.value,
              onItemPressed: controller.selectCity,
              itemLabel: (item) => item.city,
            ),
          ),
        ),

        _hGap20,
        Text('Subdistrict', style: Poppins(fontSize: 13)),
        _hGap10,
        IgnorePointer(
          ignoring: controller.isNearMe.value,
          child: Opacity(
            opacity: controller.isNearMe.value ? 0.5 : 1,
            child: _buildOptionTile<Subdistrict>(
              title:
                  controller.selectedSubdistrict.value?.subdistrict ??
                  (controller.selectedCity.value == null
                      ? "Select city first"
                      : "Please select"),
              items: controller.filteredSubdistricts,
              searchKey: (item) => item.subdistrict,
              initialSelectedItem: controller.selectedSubdistrict.value,
              onItemPressed: controller.selectSubdistrict,
              itemLabel: (item) => item.subdistrict,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCandidateFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Job Type', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title: controller.selectedJobType.value?.label ?? "Please select",
          items: controller.jobTypes,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedJobType.value,
          onItemPressed: (item) => controller.selectedJobType.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Work System', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title: controller.selectedWorkSystem.value?.label ?? "Please select",
          items: controller.workSystems,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedWorkSystem.value,
          onItemPressed: (item) => controller.selectedWorkSystem.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Salary Range', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title: controller.selectedSalaryRange.value?.label ?? "Please select",
          items: controller.salaryRanges,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedSalaryRange.value,
          onItemPressed: (item) => controller.selectedSalaryRange.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Company Verified', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title:
              controller.selectedCompanyVerified.value?.label ??
              "Please select",
          items: controller.companyVerifiedOptions,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedCompanyVerified.value,
          onItemPressed: (item) =>
              controller.selectedCompanyVerified.value = item,
          itemLabel: (item) => item.label,
        ),
      ],
    );
  }

  Widget _buildCompanyFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vacancy Status', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title:
              controller.selectedVacancyStatus.value?.label ?? "Please select",
          items: controller.vacancyStatuses,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedVacancyStatus.value,
          onItemPressed: (item) =>
              controller.selectedVacancyStatus.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Applicant Status', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title:
              controller.selectedApplicantStatus.value?.label ??
              "Please select",
          items: controller.applicantStatuses,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedApplicantStatus.value,
          onItemPressed: (item) =>
              controller.selectedApplicantStatus.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Education Level', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title:
              controller.selectedEducationLevel.value?.label ?? "Please select",
          items: controller.educationLevels,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedEducationLevel.value,
          onItemPressed: (item) =>
              controller.selectedEducationLevel.value = item,
          itemLabel: (item) => item.label,
        ),
        _hGap20,
        Text('Experience Level', style: Poppins(fontSize: 13)),
        _hGap10,
        _buildOptionTile<FilterOption>(
          title:
              controller.selectedExperienceLevel.value?.label ??
              "Please select",
          items: controller.experienceLevels,
          searchKey: (item) => item.label,
          initialSelectedItem: controller.selectedExperienceLevel.value,
          onItemPressed: (item) =>
              controller.selectedExperienceLevel.value = item,
          itemLabel: (item) => item.label,
        ),
      ],
    );
  }

  Widget _buildOptionTile<T>({
    required String title,
    required List<T> items,
    required String Function(T) searchKey,
    required T? initialSelectedItem,
    required ValueChanged<T> onItemPressed,
    required String Function(T) itemLabel,
  }) {
    return ReusableExpansionTile<T>(
      trailingColor: grey,
      textColor: black,
      borderColor: grey,
      dividerColor: grey,
      maxVisibleItems: 3,
      itemHeight: 48,
      title: title,
      titleAlignment: Alignment.centerLeft,
      fontSize: 12,
      items: items,
      enableSearch: true,
      searchKey: searchKey,
      closeOnSelect: true,
      initialSelectedItem: initialSelectedItem,
      onExpansionChanged: (_) {},
      onItemPressed: onItemPressed,
      itemBuilder: (item, isSelected) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            itemLabel(item),
            style: Poppins(
              color: isSelected ? orange : grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      },
    );
  }
}
