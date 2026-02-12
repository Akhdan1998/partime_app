part of '../pages.dart';

Future<void> showReusableBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isScrollControlled = true,
  double? heightFraction,
  VoidCallback? onComplete,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    isDismissible: false,
    enableDrag: true,
    backgroundColor: white,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: child,
        ),
      );
    },
  ).whenComplete(() {
    if (onComplete != null) {
      onComplete();
    }
  });
}
