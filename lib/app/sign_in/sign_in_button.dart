import 'package:example_app/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton(
      {String text,
      Color textColor,
      Color color,
      double borderRadius,
      VoidCallback onPressed})
      : assert(text != null),
        super(
          child: Text(
            '$text',
            style: TextStyle(color: textColor),
          ),
          color: color,
          borderRadius: borderRadius,
          onPressed: onPressed,
        );
}
