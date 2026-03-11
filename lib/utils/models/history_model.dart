part of '../../pages.dart';

class HistoryItemData {
  final String title;
  final String position;
  final String dateTime;
  final String status;
  final Color statusColor;
  final int rating;
  final bool showRating;

  const HistoryItemData({
    required this.title,
    required this.position,
    required this.dateTime,
    required this.status,
    required this.statusColor,
    this.rating = 0,
    this.showRating = false,
  });
}