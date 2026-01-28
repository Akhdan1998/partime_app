part of '../../pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController anim;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _timer = Timer(const Duration(seconds: 3), () {
      Get.offAll(Boarding());
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    anim.dispose();
    super.onClose();
  }
}
