import 'package:evently/screens/common/custom_button.dart';
import 'package:evently/screens/home%20screen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

import '../common/show_modal_bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: height * 0.05,
              left: width * 0.05,
              right: width * 0.05,
            ),
            height: height * 0.25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 3,
                  height: width / 3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                      topRight: langProvider.isEnglish
                          ? Radius.circular(1000)
                          : Radius.circular(24),
                      bottomRight: Radius.circular(1000),
                      topLeft: langProvider.isEnglish
                          ? Radius.circular(24)
                          : Radius.circular(1000),
                    ),
                  ),
                  child: Image.asset("assets/img/pp.png"),
                ),
                SizedBox(
                  width: width / 2,
                  height: width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomePage.customText(
                        text: AppLocalizations.of(context)!.john,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: height * 0.008),
                      Expanded(
                        child: HomePage.customText(
                          text: 'johnsafwat.route@gmail.com',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: width, height: height * 0.02),
                HomePage.customText(
                  text: AppLocalizations.of(context)!.theme,
                  color:
                      langProvider.isDark ? AppColors.white : AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: height * 0.01),
                CustomButton(
                  text:
                      langProvider.isEnglish
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                  color: AppColors.primaryColor,
                  borderRadius: 1,
                  backgroundColor: Colors.transparent,
                  prefixIcon: Icons.arrow_drop_down,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ShowModalBottomSheet(
                          text1: AppLocalizations.of(context)!.english ,
                          text2: AppLocalizations.of(context)!.arabic,
                          toggleLang: true,
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: height * 0.01),
                HomePage.customText(
                  text: AppLocalizations.of(context)!.theme,
                  color:
                  langProvider.isDark ? AppColors.white : AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: height * 0.01),
                CustomButton(
                  text:
                  langProvider.isDark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  color: AppColors.primaryColor,
                  borderRadius: 1,
                  backgroundColor: Colors.transparent,
                  prefixIcon: Icons.arrow_drop_down,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ShowModalBottomSheet(
                          text1: AppLocalizations.of(context)!.light,
                          text2: AppLocalizations.of(context)!.dark,
                          toggleLang: false,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
SizedBox(
                          height: height / 6,
                          child: Column(
                            children: [
                              CustomButton(
                                text: AppLocalizations.of(context)!.dark,
                                color:
                                    langProvider.isDark
                                        ? AppColors.white
                                        : AppColors.black,
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  langProvider.toggleTheme();
                                  Navigator.pop(context);
                                },
                              ),
                              CustomButton(
                                text: AppLocalizations.of(context)!.light,
                                color:
                                    langProvider.isDark
                                        ? AppColors.white
                                        : AppColors.black,
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  langProvider.toggleTheme();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        )
 */
