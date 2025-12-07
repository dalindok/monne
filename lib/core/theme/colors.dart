import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF3498DB);
  static const secondary = Color(0xFFD8B226);
  static const tertiary = Color(0xFF091734);
  static const black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0x00f6f7fb);
  static const secondaryTextLight = Color(0xFF8F96B1);
  //purple
  static const purpleLight = Color(0xFF8C6FF7);
  static const purplePrimary = Color(0xFF5A31F4);
  static const purpleDark = Color(0xFF3F22AB);
  //orange
  static const orangeLight = Color(0xFFFFF0DD);
  static const orangePrimary = Color(0xFFFF9F21);
  //green
  static const greenLight = Color(0xFF5BD51E);
  static const greenPrimary = Color(0xFF60BA62);
  static const greenDark = Color(0xFF4AC272);
  //blue
  static const darkCyanBlue = Color(0xFF2C5054);
  static const blueLight = Color(0xFF4F6FB4);
  //grey
  static const greyLight = Color(0xFF6A7486);
  static const greyPrimary = Color(0xFFB9C2C3);
  static const greySecondary = Color(0xFFB9C2C3);
  static const greyDark = Color(0xFF163336);
  //red
  static const redPrimary = Color(0xFFFC3B3B);
  //order color status
  static const processing = Color(0xFFFFBA7A);
  static const inDelivery = Color(0xFFE8DB67);
  static const delivered = Color(0xFF62C684);
  //neutrals
  static const neutral0 = Color(0xFF000000);
  static const neutral4 = Color(0xFF0c0e11);
  static const neutral6 = Color(0xFF111416);
  static const neutral10 = Color(0xFF1a1c1e);
  static const neutral12 = Color(0xFF1e2022);
  static const neutral17 = Color(0xFF282a2d);
  static const neutral20 = Color(0xFF2e3133);
  static const neutral22 = Color(0xFF333537);
  static const neutral24 = Color(0xFF37393c);
  static const neutral30 = Color(0xFF454749);
  static const neutral40 = Color(0xFF5d5e61);
  static const neutral50 = Color(0xFF76777a);
  static const neutral60 = Color(0xFF8f9193);
  static const neutral70 = Color(0xFFaaabae);
  static const neutral72 = Color(0xFFa1dffc);
  static const neutral80 = Color(0xFFc6c6c9);
  static const neutral87 = Color(0xFFd9dadd);
  static const neutral89 = Color(0xFFe1f0ff);
  static const neutral90 = Color(0xFFe2e2e5);
  static const neutral92 = Color(0xFFe8e8eb);
  static const neutral94 = Color(0xFFedeef1);
  static const neutral95 = Color(0xFFf0f0f3);
  static const neutral96 = Color(0xFFf3f3f6);
  static const neutral98 = Color(0xFFf6f7fb);
  static const neutral100 = Color(0xFFffffff);
  // membership
  static const Color bronze = Color(0xFFCD7F32); // Bronze
  static const Color silver = Color(0xFFC0C0C0); // Silver
  static const Color gold = Color(0xFFFFD700); // Gold
  static const Color platinum = Color(0xFFE5E4E2); // Platinum
  static const Color diamond = Color(0xFFB9F2FF); // Diamond
}

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.dark,
    required this.transparent,
    required this.primaryText,
    required this.secondaryText,
    required this.tertiary,
    required this.neutral0,
    required this.neutral4,
    required this.neutral6,
    required this.neutral10,
    required this.neutral12,
    required this.neutral17,
    required this.neutral20,
    required this.neutral22,
    required this.neutral24,
    required this.neutral30,
    required this.neutral40,
    required this.neutral50,
    required this.neutral60,
    required this.neutral70,
    required this.neutral72,
    required this.neutral80,
    required this.neutral87,
    required this.neutral89,
    required this.neutral90,
    required this.neutral92,
    required this.neutral94,
    required this.neutral95,
    required this.neutral96,
    required this.neutral98,
    required this.neutral100,
    required this.purpleLight,
    required this.purplePrimary,
    required this.purpleDark,
    required this.orangeLight,
    required this.orangePrimary,
    required this.greenLight,
    required this.greenPrimary,
    required this.greenDark,
    required this.darkCyanBlue,
    required this.blueLight,
    required this.greyLight,
    required this.redPrimary,
    required this.greyPrimary,
    required this.greySecondary,
    required this.greyDark,
    required this.processing,
    required this.inDelivery,
    required this.delivered,
    required this.bronze,
    required this.silver,
    required this.gold,
    required this.platinum,
    required this.diamond,
  });

  /// Main primary color
  final Color primary;

  /// Main secondary color
  final Color secondary;

  /// Main tertiary color
  final Color tertiary;
  final Color transparent;

  final Color white;
  final Color dark;
  final Color primaryText;
  final Color secondaryText;

  //purple
  final Color purpleLight;
  final Color purplePrimary;
  final Color purpleDark;
  //orange
  final Color orangeLight;
  final Color orangePrimary;
  //green
  final Color greenLight;
  final Color greenPrimary;
  final Color greenDark;
  //Blue
  final Color darkCyanBlue;
  final Color blueLight;
  //grey
  final Color greyLight;
  final Color greyPrimary;
  final Color greySecondary;
  final Color greyDark;
  //red
  final Color redPrimary;
  // order status
  final Color processing;
  final Color inDelivery;
  final Color delivered;

  // neutral
  final Color neutral0;
  final Color neutral4;
  final Color neutral6;
  final Color neutral10;
  final Color neutral12;
  final Color neutral17;
  final Color neutral20;
  final Color neutral22;
  final Color neutral24;
  final Color neutral30;
  final Color neutral40;
  final Color neutral50;
  final Color neutral60;
  final Color neutral70;
  final Color neutral72;
  final Color neutral80;
  final Color neutral87;
  final Color neutral89;
  final Color neutral90;
  final Color neutral92;
  final Color neutral94;
  final Color neutral95;
  final Color neutral96;
  final Color neutral98;
  final Color neutral100;

  // membership
  final Color bronze;
  final Color silver;
  final Color gold;
  final Color platinum;
  final Color diamond;

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (identical(this, other)) {
      return this;
    }
    return AppColorScheme(
      primary: primary,
      primaryText: primaryText,
      secondary: secondary,
      secondaryText: secondaryText,
      transparent: transparent,
      white: white,
      dark: dark,
      tertiary: tertiary,
      neutral0: neutral0,
      neutral4: neutral4,
      neutral6: neutral6,
      neutral10: neutral10,
      neutral12: neutral12,
      neutral17: neutral17,
      neutral20: neutral20,
      neutral22: neutral22,
      neutral24: neutral24,
      neutral30: neutral30,
      neutral40: neutral40,
      neutral50: neutral50,
      neutral60: neutral60,
      neutral70: neutral70,
      neutral72: neutral72,
      neutral80: neutral80,
      neutral87: neutral87,
      neutral89: neutral89,
      neutral90: neutral90,
      neutral92: neutral92,
      neutral94: neutral94,
      neutral95: neutral95,
      neutral96: neutral96,
      neutral98: neutral98,
      neutral100: neutral100,
      purpleLight: purpleLight,
      purplePrimary: purplePrimary,
      purpleDark: purpleDark,
      orangeLight: orangeLight,
      orangePrimary: orangePrimary,
      greenLight: greenLight,
      greenPrimary: greenPrimary,
      greenDark: greenDark,
      darkCyanBlue: darkCyanBlue,
      blueLight: blueLight,
      greyLight: greyLight,
      redPrimary: redPrimary,
      greyPrimary: greyPrimary,
      greySecondary: greySecondary,
      greyDark: greyDark,
      processing: processing,
      inDelivery: inDelivery,
      delivered: delivered,
      bronze: bronze,
      silver: silver,
      gold: gold,
      platinum: platinum,
      diamond: diamond,
    );
  }

  @override
  AppColorScheme copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? white,
    Color? dark,
    Color? primaryText,
    Color? secondaryText,
    Color? neutral0,
    Color? neutral4,
    Color? neutral6,
    Color? neutral10,
    Color? neutral12,
    Color? neutral17,
    Color? neutral20,
    Color? neutral22,
    Color? neutral24,
    Color? neutral30,
    Color? neutral40,
    Color? neutral50,
    Color? neutral60,
    Color? neutral70,
    Color? neutral72,
    Color? neutral80,
    Color? neutral87,
    Color? neutral89,
    Color? neutral90,
    Color? neutral92,
    Color? neutral94,
    Color? neutral95,
    Color? neutral96,
    Color? neutral98,
    Color? neutral100,
    Color? purpleLight,
    Color? purplePrimary,
    Color? purpleDark,
    Color? orangeLight,
    Color? orangePrimary,
    Color? greenLight,
    Color? greenPrimary,
    Color? greenDark,
    Color? transparent,
    Color? darkCyanBlue,
    Color? blueLight,
    Color? greyLight,
    Color? redPrimary,
    Color? greyPrimary,
    Color? greySecondary,
    Color? greyDark,
    Color? processing,
    Color? inDelivery,
    Color? delivered,
    Color? bronze,
    Color? silver,
    Color? gold,
    Color? platinum,
    Color? diamond,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      white: white ?? this.white,
      dark: dark ?? this.dark,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      tertiary: tertiary ?? this.tertiary,
      neutral0: neutral0 ?? this.neutral0,
      neutral4: neutral4 ?? this.neutral4,
      neutral6: neutral6 ?? this.neutral6,
      neutral10: neutral10 ?? this.neutral10,
      neutral12: neutral12 ?? this.neutral12,
      neutral17: neutral17 ?? this.neutral17,
      neutral20: neutral20 ?? this.neutral20,
      neutral22: neutral22 ?? this.neutral22,
      neutral24: neutral24 ?? this.neutral24,
      neutral30: neutral30 ?? this.neutral30,
      neutral40: neutral40 ?? this.neutral40,
      neutral50: neutral50 ?? this.neutral50,
      neutral60: neutral60 ?? this.neutral60,
      neutral70: neutral70 ?? this.neutral70,
      neutral72: neutral72 ?? this.neutral72,
      neutral80: neutral80 ?? this.neutral80,
      neutral87: neutral87 ?? this.neutral87,
      neutral89: neutral89 ?? this.neutral89,
      neutral90: neutral90 ?? this.neutral90,
      neutral92: neutral92 ?? this.neutral92,
      neutral94: neutral94 ?? this.neutral94,
      neutral95: neutral95 ?? this.neutral95,
      neutral96: neutral96 ?? this.neutral96,
      neutral98: neutral98 ?? this.neutral98,
      neutral100: neutral100 ?? this.neutral100,
      orangePrimary: orangeLight ?? this.orangePrimary,
      purpleLight: purpleLight ?? this.purpleLight,
      purplePrimary: purplePrimary ?? this.purplePrimary,
      purpleDark: purpleDark ?? this.purpleDark,
      orangeLight: orangeLight ?? this.orangeLight,
      greenLight: greenLight ?? this.greenLight,
      greenPrimary: greenPrimary ?? this.greenPrimary,
      greenDark: greenDark ?? this.greenDark,
      transparent: transparent ?? this.transparent,
      darkCyanBlue: darkCyanBlue ?? this.darkCyanBlue,
      blueLight: blueLight ?? this.blueLight,
      greyLight: greyLight ?? this.greyLight,
      redPrimary: redPrimary ?? this.redPrimary,
      greyPrimary: greyPrimary ?? this.greyPrimary,
      greySecondary: greySecondary ?? this.greySecondary,
      greyDark: greyDark ?? this.greyDark,
      processing: processing ?? this.processing,
      inDelivery: inDelivery ?? this.inDelivery,
      delivered: delivered ?? this.delivered,
      bronze: bronze ?? this.bronze,
      silver: silver ?? this.silver,
      gold: gold ?? this.gold,
      platinum: platinum ?? this.platinum,
      diamond: diamond ?? this.diamond,
    );
  }
}
