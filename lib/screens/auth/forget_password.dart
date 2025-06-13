import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/screens/common/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/change_lang.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var changeLang = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: changeLang.isDark ? AppColors.white : AppColors.black,
        ),
        title: Text(AppLocalizations.of(context)!.forget_password,style: TextStyle(
          color: changeLang.isDark ? AppColors.white : AppColors.black,
          fontWeight: FontWeight.w700
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height * 0.4,
              child: Image.asset(
                'assets/img/forget password.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: height*0.04,),
            CustomButton(text: AppLocalizations.of(context)!.rePassword,onPressed: () {

            },)
          ],
        ),
      ),
    );
  }
}
