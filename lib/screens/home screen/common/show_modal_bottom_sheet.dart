import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import '../../common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowModalBottomSheet extends StatelessWidget {
  final String text1;
  final String text2;
  final bool toggleLang;
  const ShowModalBottomSheet({
    super.key,
    required this.text1,
    required this.text2,
    required this.toggleLang,
  });

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 6,
      child: Column(
        children: [
          CustomButton(
            text: text1,
            color: langProvider.isDark ? AppColors.white : AppColors.black,
            backgroundColor: Colors.transparent,
            onPressed: () {
              toggleLang
                  ? langProvider.setEnglish()
                  : langProvider.setLight();
              Navigator.pop(context);
            },
          ),
          CustomButton(
            text: text2,
            color: langProvider.isDark ? AppColors.white : AppColors.black,
            backgroundColor: Colors.transparent,
            onPressed: () {
              toggleLang
                  ? langProvider.setArabic()
                  : langProvider.setDark();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
