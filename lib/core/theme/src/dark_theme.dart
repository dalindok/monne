import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monee/core/theme/colors.dart';
import 'package:monee/core/theme/fonts.dart';

const ColorScheme colorSchemeDark = ColorScheme(
  surface: AppColors.black,
  onSurface: AppColors.white,
  //
  primary: AppColors.primary,
  // primaryContainer: Color(0xFFEE3075),
  onPrimary: AppColors.black,
  secondary: AppColors.secondary,
  secondaryContainer: Color(0xFFF7F7F7),
  onSecondary: Color(0xFFF7F7F7),
  //
  error: Color(0xFFF0271B),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.dark,
  //neutrals
);

final colorSchemeDarkExt = AppColorScheme(
  dark: AppColors.white,
  white: AppColors.black,
  primary: AppColors.primary,
  secondary: AppColors.secondary,
  tertiary: AppColors.tertiary,
  primaryText: AppColors.white,
  secondaryText: AppColors.secondaryTextLight,
  neutral0: AppColors.neutral100,
  neutral4: AppColors.neutral98,
  neutral6: AppColors.neutral96,
  neutral10: AppColors.neutral94,
  neutral12: AppColors.neutral92,
  neutral17: AppColors.neutral90,
  neutral20: AppColors.neutral89,
  neutral22: AppColors.neutral87,
  neutral24: AppColors.neutral80,
  neutral30: AppColors.neutral72,
  neutral40: AppColors.neutral70,
  neutral50: AppColors.neutral60,
  neutral60: AppColors.neutral50,
  neutral70: AppColors.neutral40,
  neutral72: AppColors.neutral30,
  neutral80: AppColors.neutral24,
  neutral87: AppColors.neutral22,
  neutral89: AppColors.neutral20,
  neutral90: AppColors.neutral17,
  neutral92: AppColors.neutral12,
  neutral94: AppColors.neutral10,
  neutral95: AppColors.neutral6,
  neutral96: AppColors.neutral4,
  neutral98: AppColors.neutral0,
  neutral100: AppColors.neutral0,
  purpleLight: AppColors.purpleLight,
  purplePrimary: AppColors.purplePrimary,
  purpleDark: AppColors.purpleDark,
  orangeLight: AppColors.orangeLight,
  orangePrimary: AppColors.orangePrimary,
  greenLight: AppColors.greenLight,
  greenPrimary: AppColors.greenPrimary,
  greenDark: AppColors.greenDark,
  transparent: AppColors.transparent,
  darkCyanBlue: AppColors.darkCyanBlue,
  blueLight: AppColors.blueLight,
  greyLight: AppColors.greyLight,
  redPrimary: AppColors.redPrimary,
  greyPrimary: AppColors.greyPrimary,
  greyDark: AppColors.greyDark,
  greySecondary: AppColors.greySecondary,
  processing: AppColors.processing,
  inDelivery: AppColors.inDelivery,
  delivered: AppColors.delivered,
  bronze: AppColors.bronze,
  silver: AppColors.silver,
  gold: AppColors.gold,
  platinum: AppColors.platinum,
  diamond: AppColors.diamond,
);

final darkTheme = ThemeData(
  extensions: [
    colorSchemeDarkExt,
    const FlashToastTheme(),
    const FlashBarTheme(),
  ],
  useMaterial3: false,
  chipTheme: ChipThemeData(
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      fontSize: 12,
    ),
    deleteIconColor: Colors.black,
    backgroundColor: colorSchemeDarkExt.primary,
    checkmarkColor: Colors.black,
    labelStyle: const TextStyle(
      color: Colors.black,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      fontSize: 12,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    indicatorColor: colorSchemeDarkExt.neutral0,
    labelColor: colorSchemeDarkExt.neutral0,
    unselectedLabelColor: colorSchemeDarkExt.neutral0.withValues(alpha: 0.5),
    labelPadding: EdgeInsets.zero,
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      // fontFamily: ,
      // fontFamilyFallback: [Fonts.kh],
    ),
  ),
  // scaffoldBackgroundColor: const Color(0xFFdddddd),
  // scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  // dividerTheme:
  //     const DividerThemeData(thickness: 0.5, color: AppColors.divider),
  textTheme: Typography.material2021().black
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displayMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displaySmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
      )
      .apply(
        bodyColor: colorSchemeDarkExt.primaryText,
        displayColor: colorSchemeDarkExt.primaryText,
        fontFamily: Fonts.en,
        fontFamilyFallback: [Fonts.kh],
      ),
  colorScheme: colorSchemeDark,
  primaryColor: colorSchemeDarkExt.primary,
  // primaryColorDark: colorSchemeDarkExt.primary900,
  // primaryColorLight: colorSchemeDarkExt.primary400,
  datePickerTheme: const DatePickerThemeData(),
  fontFamily: Fonts.en,
  fontFamilyFallback: const [Fonts.kh, Fonts.en],
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: Colors.transparent,
    childrenPadding: const EdgeInsets.all(16),
    iconColor: colorSchemeDarkExt.primary,
    textColor: colorSchemeDarkExt.primaryText,
    collapsedTextColor: colorSchemeDarkExt.primaryText,
    collapsedIconColor: colorSchemeDarkExt.primary,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      // color: colorSchemeDarkExt.lightShadeGray50,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.en, Fonts.kh],
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    fillColor: Colors.transparent,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 2,
        color: colorSchemeDarkExt.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        // color: Colors.red,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: colorSchemeDarkExt.darkShadeGray60,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    enableFeedback: false,
    elevation: 1,
    backgroundColor: ThemeData.dark().bottomNavigationBarTheme.backgroundColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    // unselectedItemColor: colorSchemeDarkExt.lightShadeGray50,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      height: 1.8,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      color: AppColors.secondaryTextLight,
      fontFamilyFallback: [Fonts.kh],
      height: 1.8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) {
      return const Icon(
        Icons.chevron_left_rounded,
        size: 36,
      );
    },
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      padding: const EdgeInsets.all(10),
      iconSize: 20,
      backgroundColor: colorSchemeDark.onSurface,
      foregroundColor: colorSchemeDark.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeDark.onSurface,
      fontFamily: Fonts.en,
    ),
    iconTheme: IconThemeData(
      color: colorSchemeDark.onSurface,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    actionsIconTheme: IconThemeData(
      size: 24,
      color: colorSchemeDark.onSurface,
    ),
    centerTitle: true,
  ),
);
