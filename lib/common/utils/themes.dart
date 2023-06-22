import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

class ThemesApp {
  // Configure light theme mode
  static final ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(background: Pallets.backgroundColorDark),
    scaffoldBackgroundColor: Pallets.backgroundColorDark,
    extensions: [CustomThemeExtension.darkMode],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallets.green,
        foregroundColor: Pallets.backgroundColorDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Pallets.greyBackgroundColor,
      modalBackgroundColor: Pallets.greyBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Pallets.grey,
      backgroundColor: Pallets.greyBackgroundColor,
      iconTheme: IconThemeData(color: Pallets.grey),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Pallets.green,
          width: 3,
        ),
      ),
      labelColor: Pallets.darkGreen,
      unselectedLabelColor: Pallets.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Pallets.darkGreen,
      foregroundColor: Colors.white,
    ),
  );

  // Configure light theme mode
  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(background: Pallets.backgroundColorLight),
    scaffoldBackgroundColor: Pallets.backgroundColorLight,
    extensions: [CustomThemeExtension.lightMode],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallets.darkGreen,
        foregroundColor: Pallets.backgroundColorLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Pallets.backgroundColorLight,
      modalBackgroundColor: Pallets.backgroundColorLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Pallets.darkGreen,
      iconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white, width: 3),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Pallets.darkGreen,
      foregroundColor: Colors.white,
    ),
  );
}
