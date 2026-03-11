part of '../../../pages.dart';

class SortController extends GetxController {
  final role = 'company'.obs;

  final RxBool isNearMe = false.obs;

  final selectedCategory = Rxn<JobCategory>();
  final selectedCity = Rxn<City>();
  final selectedSubdistrict = Rxn<Subdistrict>();

  // candidate filters
  final selectedJobType = Rxn<FilterOption>();
  final selectedWorkSystem = Rxn<FilterOption>();
  final selectedSalaryRange = Rxn<FilterOption>();
  final selectedCompanyVerified = Rxn<FilterOption>();

  // company filters
  final selectedVacancyStatus = Rxn<FilterOption>();
  final selectedApplicantStatus = Rxn<FilterOption>();
  final selectedEducationLevel = Rxn<FilterOption>();
  final selectedExperienceLevel = Rxn<FilterOption>();

  final jobCategories = <JobCategory>[
    JobCategory(id: '1', name: 'Teknologi & IT'),
    JobCategory(id: '2', name: 'Bisnis & Manajemen'),
    JobCategory(id: '3', name: 'Keuangan & Akuntansi'),
    JobCategory(id: '4', name: 'Marketing, Sales & Komunikasi'),
    JobCategory(id: '5', name: 'Pendidikan & Pelatihan'),
    JobCategory(id: '6', name: 'Kesehatan & Medis'),
    JobCategory(id: '7', name: 'Teknik & Engineering'),
    JobCategory(id: '8', name: 'Konstruksi & Properti'),
    JobCategory(id: '9', name: 'Manufaktur & Produksi'),
    JobCategory(id: '10', name: 'Transportasi & Logistik'),
    JobCategory(id: '11', name: 'Hukum & Pemerintahan'),
    JobCategory(id: '12', name: 'Keamanan & Pertahanan'),
    JobCategory(id: '13', name: 'Seni, Kreatif & Media'),
    JobCategory(id: '14', name: 'Hospitality, Pariwisata & Layanan'),
    JobCategory(id: '15', name: 'Sumber Daya Alam & Lingkungan'),
    JobCategory(id: '16', name: 'Sains & Penelitian'),
    JobCategory(id: '17', name: 'Sumber Daya Manusia (HR)'),
    JobCategory(id: '18', name: 'Administrasi & Perkantoran'),
    JobCategory(id: '19', name: 'Customer Service & Support'),
    JobCategory(id: '20', name: 'Retail & Perdagangan'),
    JobCategory(id: '21', name: 'E-commerce & Digital Business'),
    JobCategory(id: '22', name: 'Freelance & Gig Economy'),
    JobCategory(id: '23', name: 'Startup & Entrepreneurship'),
    JobCategory(id: '24', name: 'Sosial & Kemanusiaan'),
    JobCategory(id: '25', name: 'Olahraga & Kebugaran'),
    JobCategory(id: '26', name: 'Fashion & Kecantikan'),
    JobCategory(id: '27', name: 'Makanan & Minuman (F&B)'),
    JobCategory(id: '28', name: 'Energi & Pertambangan'),
    JobCategory(id: '29', name: 'Telekomunikasi'),
    JobCategory(id: '30', name: 'Game, Esports & Streaming'),
  ].obs;

  final cities = <City>[
    City(id: '1', city: 'Jakarta Selatan'),
    City(id: '2', city: 'Jakarta Timur'),
    City(id: '3', city: 'Jakarta Barat'),
    City(id: '4', city: 'Bandung'),
    City(id: '5', city: 'Depok'),
  ].obs;

  final allSubdistricts = <Subdistrict>[
    Subdistrict(id: '1', cityId: '1', subdistrict: 'Kebayoran Baru'),
    Subdistrict(id: '2', cityId: '1', subdistrict: 'Mampang Prapatan'),
    Subdistrict(id: '3', cityId: '1', subdistrict: 'Pasar Minggu'),
    Subdistrict(id: '4', cityId: '1', subdistrict: 'Tebet'),
    Subdistrict(id: '5', cityId: '2', subdistrict: 'Cakung'),
    Subdistrict(id: '6', cityId: '2', subdistrict: 'Duren Sawit'),
    Subdistrict(id: '7', cityId: '2', subdistrict: 'Matraman'),
    Subdistrict(id: '8', cityId: '3', subdistrict: 'Kembangan'),
    Subdistrict(id: '9', cityId: '3', subdistrict: 'Palmerah'),
    Subdistrict(id: '10', cityId: '3', subdistrict: 'Grogol Petamburan'),
    Subdistrict(id: '11', cityId: '4', subdistrict: 'Coblong'),
    Subdistrict(id: '12', cityId: '4', subdistrict: 'Lengkong'),
    Subdistrict(id: '13', cityId: '4', subdistrict: 'Sukajadi'),
    Subdistrict(id: '14', cityId: '5', subdistrict: 'Beji'),
    Subdistrict(id: '15', cityId: '5', subdistrict: 'Cinere'),
    Subdistrict(id: '16', cityId: '5', subdistrict: 'Pancoran Mas'),
  ].obs;

  final jobTypes = <FilterOption>[
    FilterOption(id: '1', label: 'Part Time'),
    FilterOption(id: '2', label: 'Full Time'),
    FilterOption(id: '3', label: 'Freelance'),
    FilterOption(id: '4', label: 'Internship'),
  ].obs;

  final workSystems = <FilterOption>[
    FilterOption(id: '1', label: 'On Site'),
    FilterOption(id: '2', label: 'Hybrid'),
    FilterOption(id: '3', label: 'Remote'),
  ].obs;

  final salaryRanges = <FilterOption>[
    FilterOption(id: '1', label: '< Rp 100.000'),
    FilterOption(id: '2', label: 'Rp 100.000 - 300.000'),
    FilterOption(id: '3', label: 'Rp 300.000 - 500.000'),
    FilterOption(id: '4', label: '> Rp 500.000'),
  ].obs;

  final companyVerifiedOptions = <FilterOption>[
    FilterOption(id: '1', label: 'Verified Only'),
    FilterOption(id: '2', label: 'All Companies'),
  ].obs;

  final vacancyStatuses = <FilterOption>[
    FilterOption(id: '1', label: 'In Review'),
    FilterOption(id: '2', label: 'Active'),
    FilterOption(id: '3', label: 'Non-Active'),
    FilterOption(id: '4', label: 'Expired'),
  ].obs;

  final applicantStatuses = <FilterOption>[
    FilterOption(id: '1', label: 'Applied'),
    FilterOption(id: '2', label: 'Reviewed'),
    FilterOption(id: '3', label: 'Invited'),
    FilterOption(id: '4', label: 'Rejected'),
    FilterOption(id: '5', label: 'Hired'),
  ].obs;

  final educationLevels = <FilterOption>[
    FilterOption(id: '1', label: 'SMP'),
    FilterOption(id: '2', label: 'SMA/SMK'),
    FilterOption(id: '3', label: 'D3'),
    FilterOption(id: '4', label: 'S1'),
  ].obs;

  final experienceLevels = <FilterOption>[
    FilterOption(id: '1', label: 'No Experience'),
    FilterOption(id: '2', label: '1-2 Years'),
    FilterOption(id: '3', label: '3-5 Years'),
    FilterOption(id: '4', label: '5+ Years'),
  ].obs;

  List<Subdistrict> get filteredSubdistricts {
    final city = selectedCity.value;
    if (city == null || isNearMe.value) return [];
    return allSubdistricts.where((e) => e.cityId == city.id).toList();
  }

  @override
  void onInit() {
    super.onInit();
    role.value = (Get.arguments as String?) ?? 'company';
  }

  bool get isCompany => role.value == 'company';

  void toggleNearMe(bool value) {
    isNearMe.value = value;
    if (value) {
      selectedCity.value = null;
      selectedSubdistrict.value = null;
    }
  }

  void selectCity(City item) {
    if (isNearMe.value) return;
    selectedCity.value = item;
    selectedSubdistrict.value = null;
  }

  void selectSubdistrict(Subdistrict item) {
    if (isNearMe.value) return;
    selectedSubdistrict.value = item;
  }

  void resetFilter() {
    isNearMe.value = false;
    selectedCategory.value = null;
    selectedCity.value = null;
    selectedSubdistrict.value = null;

    selectedJobType.value = null;
    selectedWorkSystem.value = null;
    selectedSalaryRange.value = null;
    selectedCompanyVerified.value = null;

    selectedVacancyStatus.value = null;
    selectedApplicantStatus.value = null;
    selectedEducationLevel.value = null;
    selectedExperienceLevel.value = null;
  }
}
