part of '../pages.dart';

// class ButtonCustom extends StatelessWidget {
//   const ButtonCustom({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     required this.colors,
//     this.height = 64,
//     this.radius = 999,
//     this.textStyle,
//     this.padding = const EdgeInsets.symmetric(horizontal: 20),
//     this.shadow = true,
//     this.bounceDuration = const Duration(milliseconds: 110),
//     this.textColor = Colors.white,
//     this.borderColor,
//     this.borderWidth = 1,
//   });
//
//   final String text;
//   final VoidCallback? onPressed;
//
//   final List<Color> colors;
//
//   final double height;
//   final double radius;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry padding;
//   final bool shadow;
//   final Duration bounceDuration;
//   final Color textColor;
//   final Color? borderColor;
//   final double borderWidth;
//
//   bool get _enabled => onPressed != null;
//
//   @override
//   Widget build(BuildContext context) {
//     final baseTextStyle =
//         (textStyle ?? Poppins(fontSize: 13, fontWeight: FontWeight.w700))
//             .copyWith(color: textColor);
//     final bgColors = _enabled
//         ? _tone(colors)
//         : _tone(colors).map((c) => c.withOpacity(0.45)).toList();
//     final child = SizedBox(
//       height: height,
//       width: double.infinity,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(radius),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             DecoratedBox(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: bgColors,
//                 ),
//                 border: borderColor != null
//                     ? Border.all(
//                         color: borderColor!.withOpacity(_enabled ? 1 : 0.6),
//                         width: borderWidth,
//                       )
//                     : null,
//               ),
//             ),
//
//             Center(
//               child: Transform.rotate(
//                 angle: 0.785398,
//                 child: Container(
//                   width: height * 1.35,
//                   height: height * 1.35,
//                   decoration: BoxDecoration(
//                     gradient: RadialGradient(
//                       center: Alignment.center,
//                       radius: 0.75,
//                       colors: [
//                         white.withOpacity(_enabled ? 0.18 : 0.10),
//                         white.withOpacity(0.00),
//                       ],
//                       stops: const [0.0, 1.0],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: height * 0.55,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       white.withOpacity(0.00),
//                       white.withOpacity(_enabled ? 0.10 : 0.05),
//                       white.withOpacity(0.00),
//                     ],
//                     stops: const [0.0, 0.5, 1.0],
//                   ),
//                 ),
//               ),
//             ),
//
//             Center(
//               child: Padding(
//                 padding: padding,
//                 child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(text, style: baseTextStyle),
//                 ),
//               ),
//             ),
//
//             if (!_enabled) Container(color: black.withOpacity(0.08)),
//           ],
//         ),
//       ),
//     );
//
//     final decorated = shadow
//         ? DecoratedBox(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(radius),
//               boxShadow: [
//                 BoxShadow(
//                   color: black.withOpacity(_enabled ? 0.18 : 0.10),
//                   blurRadius: 18,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: child,
//           )
//         : child;
//
//     return Bounce(
//       duration: bounceDuration,
//       onPressed: _enabled ? onPressed! : () {},
//       child: AbsorbPointer(absorbing: !_enabled, child: decorated),
//     );
//   }
//
//   List<Color> _tone(List<Color> c) {
//     if (c.length == 1) return [c.first, c.first];
//     final a = c.first;
//     final b = c.last;
//
//     Color brighten(Color x) => Color.lerp(x, white, 0.10)!;
//     Color deepen(Color x) => Color.lerp(x, black, 0.08)!;
//
//     return [brighten(a), a, b, deepen(b)];
//   }
// }

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