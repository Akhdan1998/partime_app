part of '../../pages.dart';

class HistoryController extends GetxController {
  HistoryController({required this.role});

  final String role;

  final TextEditingController searchC = TextEditingController();
  final RxString searchQuery = ''.obs;

  bool get isCompany => role == 'company';

  static final List<HistoryItemData> _companyItems = [
    HistoryItemData(
      title: 'Pendekar Gendut',
      position: 'Waiter',
      dateTime: '22 Feb • 11:00 AM',
      status: 'Rejected',
      statusColor: red,
      rating: 3,
      showRating: true,
    ),
    HistoryItemData(
      title: 'Revand',
      position: 'Admin',
      dateTime: '20 Des • 14:00 AM',
      status: 'Reviewed',
      statusColor: blue,
      rating: 4,
      showRating: true,
    ),
    HistoryItemData(
      title: 'Imron',
      position: 'Head Chef',
      dateTime: '2 Mar • 08:00 AM',
      status: 'Invited',
      statusColor: green,
      rating: 5,
      showRating: true,
    ),
  ];

  static final List<HistoryItemData> _candidateItems = [
    HistoryItemData(
      title: 'Kopitagram',
      position: 'Waiter',
      dateTime: '12 Okt • 09:00 AM',
      status: 'Rejected',
      statusColor: red,
    ),
    HistoryItemData(
      title: 'PT. Arkana Dwi Mutiara',
      position: 'Admin',
      dateTime: '5 Feb • 15:00 PM',
      status: 'Reviewed',
      statusColor: blue,
    ),
    HistoryItemData(
      title: 'PT. Kolink Network Solutions',
      position: 'IT Support',
      dateTime: '15 Agu • 11:00 AM',
      status: 'Hired',
      statusColor: green,
    ),
    HistoryItemData(
      title: 'PT. Sumber Alfaria Trijaya. Tbk',
      position: 'Pramuniaga',
      dateTime: '16 Juni • 07:00 AM',
      status: 'Applied',
      statusColor: grey,
    ),
    HistoryItemData(
      title: 'Toko H Haris',
      position: 'Tukang',
      dateTime: '9 Jan • 12:00 AM',
      status: 'Shortlisted',
      statusColor: orange,
    ),
  ];

  List<HistoryItemData> get allItems =>
      isCompany ? _companyItems : _candidateItems;

  List<HistoryItemData> get filteredItems {
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) return allItems;

    return allItems.where((item) {
      return item.title.toLowerCase().contains(query) ||
          item.position.toLowerCase().contains(query) ||
          item.status.toLowerCase().contains(query) ||
          item.dateTime.toLowerCase().contains(query);
    }).toList();
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  @override
  void onClose() {
    searchC.dispose();
    super.onClose();
  }
}