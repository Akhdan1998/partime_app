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
      final height = MediaQuery.of(context).size.height;
      return SafeArea(
        top: false,
        bottom: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height * 0.90),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: child,
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    if (onComplete != null) {
      onComplete();
    }
  });
}
