part of '../pages.dart';

class CurvedHeader extends StatelessWidget {
  final Widget? child;
  final double height;

  const CurvedHeader({
    super.key,
    this.child,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF7A2F),
              Color(0xFFFF8F45),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//

class TopCurveContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final Color color;

  const TopCurveContainer({
    super.key,
    this.child,
    this.height = 400,
    this.color = const Color(0xFFEDEDED),
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}