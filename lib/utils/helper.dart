part of '../pages.dart';

Color white = 'FFFFFF'.toColor();
Color blue = '3B82F6'.toColor();
Color red = 'C01414'.toColor();
Color redAccent = Colors.redAccent.shade200;
Color black = '000000'.toColor();
Color green = '00D304'.toColor();
Color greenAccent = Colors.greenAccent;
Color grey = 'C2C2C2'.toColor();
Color orange = 'FE7F2D'.toColor();
Color orangeAccent = Colors.orangeAccent;
Color transparentColor = Colors.transparent;
final contexted = Get.context;

const _hGap5 = SizedBox(height: 5);
const _hGap10 = SizedBox(height: 10);
const _hGap15 = SizedBox(height: 15);
const _hGap20 = SizedBox(height: 20);
const _hGap30 = SizedBox(height: 30);
const _hGap50 = SizedBox(height: 50);
const _wGap5 = SizedBox(width: 5);
const _wGap10 = SizedBox(width: 10);
const _wGap15 = SizedBox(width: 15);
const _wGap20 = SizedBox(width: 20);

const List<Map<String, String>> userNavigation = [
  {'title': 'Company', 'id': '1'},
  {'title': 'Candidate', 'id': '2'},
];

String formatDateTime(DateTime dt) {
  return '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';
}