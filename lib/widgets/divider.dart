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