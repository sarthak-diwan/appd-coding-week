import 'package:example_app/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton(
      {@required String assetName,
      @required String text,
      @required Color textColor,
      @required Color color,
      double borderRadius: 14.0,
      VoidCallback onPressed})
      : assert(assetName != null),
        assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(
                  assetName,
                ),
              ),
            ],
          ),
          color: color,
          borderRadius: borderRadius,
          onPressed: onPressed,
        );
}
