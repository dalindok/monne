import 'package:flutter/material.dart';
import 'package:monee/core/enums/enum.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.child,
    this.type = ButtonType.defaultBtn,
    super.key,
    this.onPress,
  });

  final ButtonType type;
  final Widget child;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.defaultBtn:
        return ElevatedButton(
          onPressed: onPress,
          child: child,
        );

      case ButtonType.outline:
        return OutlinedButton(
          onPressed: onPress,
          child: child,
        );
    }
  }
}
