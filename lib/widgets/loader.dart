part of '../pages.dart';

class OrbitDotsLoader extends StatelessWidget {
  const OrbitDotsLoader({
    super.key,
    required this.controller,
    this.size = 42,
    this.dotSize = 6,
    this.dots = 8,
    this.color = Colors.grey,
  });

  final AnimationController controller;
  final double size;
  final double dotSize;
  final int dots;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final radius = (size - dotSize) / 2;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          final t = controller.value;
          return Stack(
            children: List.generate(dots, (i) {
              final angle = (2 * math.pi * i / dots) + (2 * math.pi * t);
              final dx = radius * math.cos(angle);
              final dy = radius * math.sin(angle);

              final phase = (i / dots + t) % 1.0;
              final scale = 0.55 + 0.6 * (1 - phase);

              final opacity = (0.25 + 0.75 * (1 - phase)).clamp(0.0, 1.0);

              return Positioned(
                left: (size / 2) + dx - (dotSize / 2),
                top: (size / 2) + dy - (dotSize / 2),
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      width: dotSize,
                      height: dotSize,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
