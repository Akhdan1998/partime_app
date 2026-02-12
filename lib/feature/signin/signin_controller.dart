part of '../../pages.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final email = TextEditingController(text: 'company@gmail.com');
  final password = TextEditingController(text: 'test123!!');

  static const String _password = 'test123!!';

  static const Map<String, String> _accounts = {
    'company@gmail.com': 'company',
    'candidate@gmail.com': 'candidate',
  };

  void login() {
    final ok = formKey.currentState?.validate() ?? false;
    if (!ok) return;

    final e = email.text.trim().toLowerCase();
    final p = password.text;

    debugPrint('LOGIN_ATTEMPT email="$e"');

    if (p != _password) {
      SnackbarHelper.info('Wrong password');
      debugPrint('LOGIN_FAIL wrong_password');
      return;
    }

    final role = _accounts[e];
    if (role == null) {
      SnackbarHelper.info('Email not registered');
      debugPrint('LOGIN_FAIL email_not_registered');
      return;
    }

    debugPrint('LOGIN_OK role="$role"');

    Get.offAll(() => FormData(), arguments: role);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}