import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

class MyUnderlineTextField extends StatelessWidget {
  final String? prefixText, hintText;
  final TextEditingController? controller;
  final bool? readOnly, autofocus;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;

  const MyUnderlineTextField({
    super.key,
    this.prefixText,
    this.hintText,
    this.controller,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.autofocus,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: autofocus ?? false,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText,
        hintText: hintText,
        suffix: suffixIcon,
        hintStyle: TextStyle(color: context.theme.greyColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Pallets.darkGreen),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Pallets.darkGreen, width: 2),
        ),
      ),
    );
  }
}
