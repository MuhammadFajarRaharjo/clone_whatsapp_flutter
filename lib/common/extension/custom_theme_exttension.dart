import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

extension ExtensionTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? circleImageColor,
      greyColor,
      blueColor,
      langBtnColor,
      langBtnHiglightColor,
      authTitleAppBarColor,
      photoIconBgColor,
      photoIconColor,
      scaffoldBacgroundColor,
      chatTextFieldColor,
      chatBackgroundColor,
      senderChatCardBg,
      reciverChatCardBg,
      bgColorChatEncription,
      textColorChatEncription;

  const CustomThemeExtension({
    this.scaffoldBacgroundColor,
    this.authTitleAppBarColor,
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnColor,
    this.langBtnHiglightColor,
    this.photoIconBgColor,
    this.photoIconColor,
    this.chatTextFieldColor,
    this.chatBackgroundColor,
    this.senderChatCardBg,
    this.reciverChatCardBg,
    this.bgColorChatEncription,
    this.textColorChatEncription,
  });

  static final lightMode = CustomThemeExtension(
    circleImageColor: const Color(0xFF25D366),
    greyColor: Pallets.darkGrey,
    blueColor: Pallets.blue,
    langBtnColor: const Color(0xFFF7F8FA),
    langBtnHiglightColor: const Color(0xFFE8E8ED),
    photoIconBgColor: const Color(0xFFF1F2F3),
    photoIconColor: const Color(0xFF9DAABE),
    authTitleAppBarColor: Pallets.green,
    scaffoldBacgroundColor: const Color.fromARGB(255, 231, 231, 231),
    chatTextFieldColor: Colors.white,
    chatBackgroundColor: const Color.fromARGB(255, 110, 223, 168),
    reciverChatCardBg: Colors.white,
    senderChatCardBg: const Color.fromARGB(255, 160, 243, 121),
    bgColorChatEncription: const Color.fromARGB(255, 245, 222, 154),
    textColorChatEncription: Pallets.darkGrey,
  );

  static final darkMode = CustomThemeExtension(
    circleImageColor: const Color(0xFF25D366),
    greyColor: Pallets.grey,
    blueColor: Pallets.lightBlue,
    langBtnColor: Pallets.blackGreen,
    langBtnHiglightColor: const Color(0xFF09141A),
    photoIconBgColor: const Color(0xFF283339),
    photoIconColor: const Color(0xFF61717B),
    authTitleAppBarColor: const Color(0xFFE9EDEF),
    scaffoldBacgroundColor: Colors.black,
    chatTextFieldColor: Pallets.greyBackgroundColor,
    reciverChatCardBg: Pallets.greyBackgroundColor,
    senderChatCardBg: Pallets.green,
    bgColorChatEncription: Pallets.greyBackgroundColor,
    textColorChatEncription: const Color.fromARGB(255, 245, 222, 154),
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnColor,
    Color? langBtnHiglightColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
    Color? authTitleAppBarColor,
    Color? scaffoldBacgroundColor,
  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnColor: langBtnColor ?? this.langBtnColor,
      langBtnHiglightColor: langBtnHiglightColor ?? this.langBtnHiglightColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
      authTitleAppBarColor: authTitleAppBarColor ?? this.authTitleAppBarColor,
      scaffoldBacgroundColor:
          scaffoldBacgroundColor ?? this.scaffoldBacgroundColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      langBtnColor: Color.lerp(langBtnColor, other.langBtnColor, t),
      langBtnHiglightColor: Color.lerp(
        langBtnHiglightColor,
        other.langBtnHiglightColor,
        t,
      ),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      authTitleAppBarColor: Color.lerp(
        authTitleAppBarColor,
        other.authTitleAppBarColor,
        t,
      ),
      scaffoldBacgroundColor: Color.lerp(
        scaffoldBacgroundColor,
        other.scaffoldBacgroundColor,
        t,
      ),
    );
  }
}
