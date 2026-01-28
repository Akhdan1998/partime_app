part of '../pages.dart';

TextStyle Poppins({
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
  TextDecoration decoration = TextDecoration.none,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}
