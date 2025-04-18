import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';

class TabBarItem extends StatelessWidget {
  final String txt;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? selectedBackgroundColor;
  final Color? unSelectedBackgroundColor;
  final Color? borderColor;
  const TabBarItem({
    super.key,
    required this.txt,
    this.isSelected = false,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color:
            isSelected
                ? selectedBackgroundColor ?? AppColors.white
                : unSelectedBackgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: borderColor ?? AppColors.white, width: 2),
      ),
      child: Text(
        txt,
        style: TextStyle(
          color:
              isSelected
                  ? selectedColor ?? AppColors.primaryColor
                  : unSelectedColor ?? AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
