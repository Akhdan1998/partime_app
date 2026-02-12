part of '../pages.dart';

class SnackbarHelper {
  static void error(String message) {
    show(
      title: 'Error',
      message: message,
      textColor: black,
      backgroundColor: grey.withOpacity(0.1),
      borderColor: transparentColor,
      iconColor: red,
      icon: Icons.error_outline,
    );
  }

  static void success(String message) {
    show(
      title: 'Success',
      message: message,
      textColor: black,
      backgroundColor: grey.withOpacity(0.1),
      borderColor: transparentColor,
      iconColor: green,
      icon: Icons.check_circle_outline,
    );
  }

  static void info(String message) {
    show(
      title: 'info'.tr,
      message: message,
      textColor: black,
      backgroundColor: grey.withOpacity(0.1),
      borderColor: transparentColor,
      iconColor: blue,
      icon: Icons.info_outline,
    );
  }

  static void show({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    IconData? icon,
    Color? iconColor,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 3),
  }) {
    final safeTitle = (title).toString();
    final safeMessage = (message).toString();

    final titleWidget = Text(
      safeTitle,
      style: TextStyle(
        color: textColor ?? white,
        fontWeight: FontWeight.bold,
      ),
    );

    final messageWidget = Text(
      safeMessage,
      style: Poppins(
        color: textColor ?? white,
      ),
    );

    final snack = GetSnackBar(
      titleText: titleWidget,
      messageText: messageWidget,
      backgroundColor: backgroundColor ?? black,
      // borderColor: borderColor ?? transparentColor,
      snackPosition: position,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      icon: icon != null ? Icon(icon, color: iconColor ?? white) : null,
      duration: duration,
      animationDuration: const Duration(milliseconds: 200),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        Get.showSnackbar(snack);
      } catch (err, st) {
        debugPrint('SHOW SNACKBAR FAILED: $err\n$st');
      }
    });
  }
}