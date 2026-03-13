part of '../../../pages.dart';

class _TwoCol extends StatelessWidget {
  const _TwoCol({
    required this.left,
    required this.right,
    this.padding = EdgeInsets.zero,
    this.spacing = 16,
  });

  final List<Widget> left;
  final List<Widget> right;
  final EdgeInsetsGeometry padding;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: left,
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: right,
            ),
          ),
        ],
      ),
    );
  }
}