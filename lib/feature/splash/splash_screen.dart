part of '../../pages.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.orangeGradient,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Partime Mon',
                style: Poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              _hGap20,
              OrbitDotsLoader(
                controller: controller.anim,
                size: 30,
                dotSize: 6,
                dots: 6,
                color: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
