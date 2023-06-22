import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

showLoadingDialog({
  required BuildContext context,
  required String message,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                height: 1.5,
                color: context.theme.greyColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
