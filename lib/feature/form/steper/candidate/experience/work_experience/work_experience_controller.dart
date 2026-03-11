part of '../../../../../../pages.dart';

class WorkExperienceController extends GetxController {
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

  final jobFields = <JobField>[
    /// Teknologi & IT
    JobField(id: '1', categoryId: '1', name: 'Software Engineer'),
    JobField(id: '2', categoryId: '1', name: 'Mobile Developer'),
    JobField(id: '3', categoryId: '1', name: 'Web Developer'),
    JobField(id: '4', categoryId: '1', name: 'Data Analyst'),
    JobField(id: '5', categoryId: '1', name: 'Data Scientist'),
    JobField(id: '6', categoryId: '1', name: 'AI / Machine Learning Engineer'),
    JobField(id: '7', categoryId: '1', name: 'DevOps Engineer'),
    JobField(id: '8', categoryId: '1', name: 'Cloud Engineer'),
    JobField(id: '9', categoryId: '1', name: 'Cyber Security Specialist'),
    JobField(id: '10', categoryId: '1', name: 'UI/UX Designer'),

    /// Bisnis & Manajemen
    JobField(id: '11', categoryId: '2', name: 'Business Analyst'),
    JobField(id: '12', categoryId: '2', name: 'Project Manager'),
    JobField(id: '13', categoryId: '2', name: 'Product Manager'),
    JobField(id: '14', categoryId: '2', name: 'Operations Manager'),
    JobField(id: '15', categoryId: '2', name: 'Management Consultant'),

    /// Keuangan & Akuntansi
    JobField(id: '16', categoryId: '3', name: 'Accountant'),
    JobField(id: '17', categoryId: '3', name: 'Financial Analyst'),
    JobField(id: '18', categoryId: '3', name: 'Auditor'),
    JobField(id: '19', categoryId: '3', name: 'Tax Consultant'),
    JobField(id: '20', categoryId: '3', name: 'Investment Analyst'),

    /// Marketing
    JobField(id: '21', categoryId: '4', name: 'Digital Marketer'),
    JobField(id: '22', categoryId: '4', name: 'SEO Specialist'),
    JobField(id: '23', categoryId: '4', name: 'Content Creator'),
    JobField(id: '24', categoryId: '4', name: 'Brand Manager'),
    JobField(id: '25', categoryId: '4', name: 'Sales Executive'),

    /// Pendidikan
    JobField(id: '26', categoryId: '5', name: 'Teacher'),
    JobField(id: '27', categoryId: '5', name: 'Lecturer'),
    JobField(id: '28', categoryId: '5', name: 'Tutor'),
    JobField(id: '29', categoryId: '5', name: 'Instructor'),
    JobField(id: '30', categoryId: '5', name: 'Education Consultant'),

    /// Kesehatan
    JobField(id: '31', categoryId: '6', name: 'Doctor'),
    JobField(id: '32', categoryId: '6', name: 'Nurse'),
    JobField(id: '33', categoryId: '6', name: 'Pharmacist'),
    JobField(id: '34', categoryId: '6', name: 'Psychologist'),
    JobField(id: '35', categoryId: '6', name: 'Nutritionist'),

    /// Teknik
    JobField(id: '36', categoryId: '7', name: 'Civil Engineer'),
    JobField(id: '37', categoryId: '7', name: 'Mechanical Engineer'),
    JobField(id: '38', categoryId: '7', name: 'Electrical Engineer'),
    JobField(id: '39', categoryId: '7', name: 'Chemical Engineer'),
    JobField(id: '40', categoryId: '7', name: 'Industrial Engineer'),

    /// Hukum
    JobField(id: '41', categoryId: '11', name: 'Lawyer'),
    JobField(id: '42', categoryId: '11', name: 'Legal Consultant'),
    JobField(id: '43', categoryId: '11', name: 'Notary'),
    JobField(id: '44', categoryId: '11', name: 'Policy Analyst'),

    /// Kreatif
    JobField(id: '45', categoryId: '13', name: 'Graphic Designer'),
    JobField(id: '46', categoryId: '13', name: 'Animator'),
    JobField(id: '47', categoryId: '13', name: 'Videographer'),
    JobField(id: '48', categoryId: '13', name: 'Photographer'),
    JobField(id: '49', categoryId: '13', name: 'Journalist'),

    /// F&B
    JobField(id: '50', categoryId: '27', name: 'Chef'),
    JobField(id: '51', categoryId: '27', name: 'Barista'),
    JobField(id: '52', categoryId: '27', name: 'Bartender'),
    JobField(id: '53', categoryId: '27', name: 'Restaurant Manager'),
  ].obs;

  final selectedCategory = Rxn<JobCategory>();
  final selectedJobField = Rxn<JobField>();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController completionDate = TextEditingController();
  final TextEditingController description = TextEditingController();
  final RxBool isChecked = false.obs;

  List<JobField> get filteredFields {
    if (selectedCategory.value == null) return [];
    return jobFields
        .where((e) => e.categoryId == selectedCategory.value!.id)
        .toList();
  }
}
