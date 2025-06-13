import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final bool currentState;
  final String buttonText1;
  final String buttonText2;
  final IconData icon1;
  final IconData icon2;
  final FutureOr<void> Function(bool) onChanged;
  const ToggleButton({
    super.key,
    required this.text,
    required this.buttonText1,
    required this.buttonText2,
    required this.icon1,
    required this.icon2,
    required this.onChanged,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<ChangeLang>(context);
    return Row(
      // textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        AnimatedToggleSwitch<bool>.dual(
          current: currentState,
          first: true,
          second: false,
          spacing: 5,
          height: 50,
          style: ToggleStyle(
            borderColor: AppColors.darkWhite,
            borderRadius: BorderRadius.circular(30),
            backgroundColor: AppColors.white,
            indicatorColor: AppColors.primaryColor,
          ),
          onChanged: onChanged,
          iconBuilder:
              (val) =>
                  val
                      ? Icon(icon1, color: AppColors.white)
                      : Icon(icon2, color: AppColors.white),
          textBuilder:
              (val) => Center(
                child: Text(
                  val ? buttonText1 : buttonText2,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
