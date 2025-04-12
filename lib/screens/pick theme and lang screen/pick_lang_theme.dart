import 'package:evently/screens/pick%20theme%20and%20lang%20screen/widgets/toggle_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors/app_colors.dart';
import '../common/custom_button.dart';
import 'package:evently/core/providers/change_lang.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PickLangTheme extends StatelessWidget {
  PickLangTheme({super.key});

  late SharedPreferences pref;

  Future<void> setTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("onboarding_done", true);
    if (kDebugMode) {
      print(pref.getBool("onboarding_done"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/evently_title.png',
          width: width * 0.45,
          height: height * 0.1,
        ),
        toolbarHeight: height * 0.1,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/onboarding_img.png'),
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.personalize,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: height * 0.008),
              Text(
                AppLocalizations.of(context)!.choose,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      languageProvider.isDark
                          ? AppColors.white
                          : AppColors.darkBlue,
                ),
              ),
              SizedBox(height: height * 0.03),
              ToggleButton(
                text: AppLocalizations.of(context)!.lang,
                buttonText1: AppLocalizations.of(context)!.en,
                buttonText2: AppLocalizations.of(context)!.ar,
                icon1: Icons.language,
                icon2: Icons.translate,
                onChanged: (p0) {
                  languageProvider.toggleLang();
                },
                currentState: languageProvider.isEnglish,
              ),
              SizedBox(height: height * 0.01),
              ToggleButton(
                text: AppLocalizations.of(context)!.theme,
                buttonText1: AppLocalizations.of(context)!.light,
                buttonText2: AppLocalizations.of(context)!.dark,
                icon1: Icons.light_mode,
                icon2: Icons.dark_mode,
                onChanged: (p0) {
                  languageProvider.toggleTheme();
                },
                currentState: !languageProvider.isDark,
              ),

              CustomButton(
                text: AppLocalizations.of(context)!.lets_start,
                onPressed: () {
                  setTrue();
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.onBoarding,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
