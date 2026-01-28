part of '../pages.dart';

class TextFieldCustom extends StatefulWidget {
  final int? maxLength;
  final String hintText;
  final bool obscureText;
  final bool icon;
  final bool readOnly;
  final bool autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double borderRadius;
  final Color fillColor;
  final bool filled;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool onlyNumbers;
  final BorderSide borderSide;
  final BorderSide? focusedBorderSide;
  final BorderSide? enabledBorderSide;
  final BorderSide? errorBorderSide;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;
  final bool? enable;
  final VoidCallback? onTap;
  final ScrollPhysics? scroll;

  const TextFieldCustom({
    super.key,
    this.maxLength,
    required this.hintText,
    this.obscureText = false,
    this.icon = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.controller,
    this.focusNode,
    this.borderRadius = 10.0,
    this.fillColor = Colors.white,
    this.filled = true,
    this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    this.onlyNumbers = false,
    this.borderSide = BorderSide.none,
    this.focusedBorderSide,
    this.enabledBorderSide,
    this.errorBorderSide,
    this.suffixIcon,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.contentPadding,
    this.validator,
    this.enable = true,
    this.onTap,
    this.scroll,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPhysics: widget.scroll,
      onTap: widget.onTap,
      enabled: widget.enable,
      validator: widget.validator,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines,
      style: Poppins(),
      cursorColor: black,
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelStyle: Poppins(color: grey),
        hintText: widget.hintText,
        hintStyle: Poppins(
          color: grey,
          fontSize: 12,
        ),
        contentPadding: widget.contentPadding ?? EdgeInsets.only(left: 12),
        filled: widget.filled,
        fillColor: widget.fillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          widget.focusedBorderSide ?? BorderSide(color: transparentColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          widget.enabledBorderSide ?? BorderSide(color: transparentColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: widget.errorBorderSide ?? BorderSide(color: red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: widget.borderSide,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText
                ? IconButton(
              icon: Icon(
                size: 20,
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: green,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null),
      ),
    );
  }
}