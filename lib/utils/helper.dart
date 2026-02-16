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

class AppGradients {
  AppGradients._();

  static LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [orange, orangeAccent],
  );

  static LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [green, greenAccent],
  );

  static LinearGradient redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [red, redAccent],
  );
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p = Path();

    p.lineTo(0, 50);

    p.quadraticBezierTo(size.width * 0.5, 0, size.width, 50);

    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

const List<Map<String, String>> userNavigation = [
  {'title': 'Company', 'id': '1'},
  {'title': 'Candidate', 'id': '2'},
];

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 50,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.fillColor,
    this.filled = true,
    this.gap = 10,
    this.contentPadding,
  });

  final String label;
  final String hintText;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final double borderRadius;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;

  final Color? fillColor;
  final bool filled;

  final double gap;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: borderColor ?? grey, width: 1);
    final focusSide = BorderSide(
      color: focusBorderColor ?? (borderColor ?? grey),
      width: 1.2,
    );
    final errorSide = BorderSide(color: errorBorderColor ?? red, width: 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Poppins(fontWeight: FontWeight.w500, fontSize: 13)),
        SizedBox(height: gap),
        TextFieldCustom(
          hintText: hintText,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          enable: enabled,
          filled: filled,
          fillColor: fillColor ?? white,
          borderRadius: borderRadius,
          borderSide: borderSide,
          enabledBorderSide: borderSide,
          focusedBorderSide: focusSide,
          errorBorderSide: errorSide,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding,
        ),
      ],
    );
  }
}

class EmploymentPolicy {
  final String id;
  final String employmentPolicy;

  EmploymentPolicy({required this.id, required this.employmentPolicy});
}

class MinimumEducation {
  final String id;
  final String minEducation;

  MinimumEducation({required this.id, required this.minEducation});
}

class Gender {
  final String id;
  final String gender;

  Gender({required this.id, required this.gender});
}

class JobCategory {
  final String id;
  final String name;

  JobCategory({required this.id, required this.name});
}

class JobField {
  final String id;
  final String categoryId;
  final String name;

  JobField({required this.id, required this.categoryId, required this.name});
}

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
              width: 140,
              child: Text(
                widget.value,
                style: Poppins(color: black, fontSize: 13), maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

String formatDateTime(DateTime dt) {
  return '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';
}