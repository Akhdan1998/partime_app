part of '../../../pages.dart';

class _LabelText extends StatelessWidget {
  const _LabelText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      height: 77,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Poppins(color: black, fontSize: 13)),
          _hGap10,
          Text(
            value,
            style: Poppins(color: orange, fontSize: 13),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}