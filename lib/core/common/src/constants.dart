import 'package:flutter/material.dart';

final List<Color> avatarColors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.indigo,
];

Color getAvatarColor(String name) {
  final colors = avatarColors;
  final index = name.codeUnits.reduce((a, b) => a + b) % colors.length;
  return colors[index];
}

const bodyPadding = EdgeInsets.all(16);
const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
const paddingVertical = EdgeInsets.symmetric(vertical: 16);

/// The standard body padding for the app.
const kBodyPadding = EdgeInsets.symmetric(horizontal: 20);
const kPadding = EdgeInsets.all(20);

/// The standard button padding for the app.
const kButtonPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 16);

/// The standard app bar button size.
const double kAppBarButtonSize = 56;

final ShapeBorder kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

final BorderRadius kBorderRadius = BorderRadius.circular(10);

/// The standard shadow for containers
const kCardShadow = [
  BoxShadow(
    blurRadius: 6,
    color: Color.fromRGBO(153, 153, 153, 0.46),
    offset: Offset(0, 2),
    spreadRadius: 0.2,
  ),
];

/// The standard shadow for containers
const kAppBarShadow = [
  BoxShadow(
    blurRadius: 9,
    color: Color.fromRGBO(153, 153, 153, 0.3),
    offset: Offset(0, 1),
    spreadRadius: 3,
  ),
];

/// The secondary shadow for containers with primaryColor
const kCardShadowPrimary = [
  BoxShadow(
    blurRadius: 32.2,
    color: Color.fromRGBO(55, 1, 120, 0.59),
    offset: Offset(0, 5),
    spreadRadius: 2.8,
  ),
];

/// The secondary shadow for buttons
const kButtonShadow = [
  BoxShadow(
    blurRadius: 9.2,
    color: Color.fromRGBO(153, 153, 153, 0.5),
    offset: Offset(0, 4),
  ),
];
