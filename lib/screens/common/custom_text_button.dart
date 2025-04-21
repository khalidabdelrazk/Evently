import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;
  const CustomTextButton({super.key, this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
