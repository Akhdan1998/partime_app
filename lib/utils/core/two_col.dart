part of '../../../pages.dart';

class _TwoCol extends StatelessWidget {
  const _TwoCol({
    required this.left,
    required this.right,
    this.padding = EdgeInsets.zero,
  });

  final List<Widget> left;
  final List<Widget> right;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: left),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: right),
        ],
      ),
    );
  }
}