part of '../pages.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 100),
      onPressed: onPressed,
      child: child,
    );
  }
}