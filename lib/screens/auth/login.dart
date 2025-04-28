import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/screens/common/custom_button.dart';
import 'package:evently/screens/common/custom_text_button.dart';
import 'package:evently/screens/common/custom_text_field.dart';
import 'package:evently/screens/common/toggle_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

import '../../core/providers/change_lang.dart';
import '../../core/routes/route_names.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  String? emailValidator(String? txt) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (txt == null) {
      return AppLocalizations.of(context)!.empty_field;
    } else if (!emailRegex.hasMatch(txt)) {
      return AppLocalizations.of(context)!.invalidEmailAddress;
    }
    return null;
  }

  String? passwordValidator(String? txt) {
    if (txt == null) {
      return AppLocalizations.of(context)!.empty_field;
    } else if (txt.length < 8) {
      return AppLocalizations.of(context)!.passwordShouldBe;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var changeLang = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.25,
                  width: width,
                  child: Center(child: Image.asset('assets/img/Logo.png')),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: AppLocalizations.of(context)!.email,
                        labelColor: AppColors.gray,
                        controller: _emailController,
                        borderColor: AppColors.gray,
                        prefixIcon: Icons.email_rounded,
                        prefixIconColor: AppColors.gray,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                        inputColor:
                            changeLang.isDark
                                ? AppColors.white
                                : AppColors.black,
                      ),
                      SizedBox(height: height * 0.01),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.password,
                        labelColor: AppColors.gray,
                        controller: _passwordController,
                        borderColor: AppColors.gray,
                        prefixIcon: Icons.lock_sharp,
                        prefixIconColor: AppColors.gray,
                        // maxLength: 12,
                        maxLines: 1,
                        obscureText: hidePassword,
                        // keyboardType: TextInputType.visiblePassword,
                        validator: passwordValidator,
                        inputColor:
                            changeLang.isDark
                                ? AppColors.white
                                : AppColors.black,
                        suffixIcon:
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                        suffixIconColor: AppColors.gray,
                        onSuffixPressed: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      txt: AppLocalizations.of(context)!.forget_password,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.forgetPassword);
                      },
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                CustomButton(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    // Todo: Login validation
                    _formKey.currentState!.validate();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.doNotHaveAccount,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            changeLang.isDark
                                ? AppColors.white
                                : AppColors.black,
                      ),
                    ),
                    CustomTextButton(txt: AppLocalizations.of(context)!.create_account,onPressed: () {
                      Navigator.pushNamed(context, RouteNames.createAccount);
                    },),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        indent: width * 0.01,
                        endIndent: width * 0.03,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: TextStyle(
                        color:
                            changeLang.isDark
                                ? AppColors.white
                                : AppColors.black,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        indent: width * 0.03,
                        endIndent: width * 0.01,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(AntDesign.google_outline, size: 30),
                      SizedBox(width: width * 0.01),
                      Text(
                        AppLocalizations.of(context)!.login_with_google,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                ToggleAnimatedButton(
                  buttonText1: AppLocalizations.of(context)!.dark,
                  buttonText2: AppLocalizations.of(context)!.light,
                  icon1: Icons.dark_mode,
                  icon2: Icons.light_mode,
                  onChanged: (p0) {
                    changeLang.toggleTheme();
                  },
                  currentState: changeLang.isDark ? false : true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
