part of '../../../pages.dart';

class _LabelValue extends StatefulWidget {
  const _LabelValue({required this.value});

  final String value;

  @override
  State<_LabelValue> createState() => _LabelValueState();
}

class _LabelValueState extends State<_LabelValue> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        color: transparentColor,
        width: 170,
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.2, color: grey),
                color: selected ? orange : white,
              ),
            ),
            _wGap15,
            SizedBox(
              width: Platform.isIOS ? 138 : 140,
              child: Text(
                widget.value,
                style: Poppins(color: black, fontSize: 13),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
