part of '../pages.dart';

class CusCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final Color activeColor;
  final Color borderColor;
  final Color checkColor;
  final double size;
  final TextStyle? textStyle;

  const CusCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor = Colors.orange,
    this.borderColor = Colors.grey,
    this.checkColor = Colors.white,
    this.size = 20,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: value ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: value ? activeColor : borderColor,
                width: 1.6,
              ),
            ),
            child: value
                ? Icon(
              Icons.check,
              size: size * 0.75,
              color: checkColor,
            )
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: 10),
            Text(
              label!,
              style: textStyle ??
                  Poppins(
                    fontSize: 13,
                  ),
            ),
          ]
        ],
      ),
    );
  }
}