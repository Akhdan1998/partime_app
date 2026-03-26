part of '../pages.dart';

Future<void> showCusDialog({
  required String title,
  required String content,
  required String confirmText,
  required String cancelText,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  bool barrierDismissible = true,
  VoidCallback? onClosed,
}) {
  return Get.dialog(
    barrierDismissible: barrierDismissible,
    Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: orange,
              ),
              padding: const EdgeInsets.only(
                  left: 20, top: 10, bottom: 10, right: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: white,
                ),
              ),
            ),
            Container(
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: grey.withOpacity(0.11),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, right: 20, bottom: 0),
                    child: Text(
                      content,
                      style: TextStyle(
                        fontSize: 14,
                        color: black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onCancel?.call();
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: transparentColor,
                            border: Border.all(
                              width: 2,
                              color: red,
                            ),
                          ),
                          child: Text(
                            cancelText,
                            style: TextStyle(color: red),
                          ),
                        ),
                      ),
                      _hGap10,
                      GestureDetector(
                        onTap: () {
                          onConfirm();
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: orange,
                          ),
                          child: Text(
                            confirmText,
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ).then((_) => onClosed?.call());
}