part of '../pages.dart';

Widget _buildDivider(
    BuildContext context, {
      Color? color,
      double? indent,
      double? endIndent,
      double? thickness,
    }) {
  return Divider(
    height: 1,
    thickness: thickness ?? 1.0,
    color: color ?? (black),
    indent: indent ?? 0.0,
    endIndent: endIndent ?? 0.0,
  );
}

Widget _vDivider({Color? color,}) {
  return Container(
    height: 35,
    width: 1,
    color: color ?? (black),
  );
}