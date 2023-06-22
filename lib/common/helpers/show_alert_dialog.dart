import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
  VoidCallback? onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: TextStyle(color: context.theme.greyColor, fontSize: 15),
        ),
        contentPadding: const EdgeInsets.all(20).copyWith(bottom: 0),
        actions: [
          TextButton(
            onPressed: onPressed ?? () => Navigator.pop(context),
            child: Text(
              btnText ?? 'OK',
              style: TextStyle(color: context.theme.circleImageColor),
            ),
          ),
        ],
      );
    },
  );
}
