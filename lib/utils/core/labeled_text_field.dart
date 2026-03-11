part of '../../../pages.dart';

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