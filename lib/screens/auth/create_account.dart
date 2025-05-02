import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/screens/common/custom_button.dart';
import 'package:evently/screens/common/custom_text_button.dart';
import 'package:evently/screens/common/custom_text_field.dart';
import 'package:evently/screens/common/toggle_animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

import '../../core/providers/change_lang.dart';
import '../../core/routes/route_names.dart';
import '../common/show_dialog_utils.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController(text: 'khalid1@gmail.com');
  final _nameController = TextEditingController(text: 'khalid');
  final _passwordController = TextEditingController(text: '11111111');
  final _rePasswordController = TextEditingController(text: '11111111');
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

  String? nameValidator(String? txt) {
    if (txt == null) {
      return AppLocalizations.of(context)!.empty_field;
    } else if (txt.length < 6) {
      return AppLocalizations.of(context)!.invalidName;
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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: changeLang.isDark ? AppColors.white : AppColors.black
        ),
        title: Text(AppLocalizations.of(context)!.register,style: TextStyle(
            color: changeLang.isDark ? AppColors.white : AppColors.black,
            fontWeight: FontWeight.w700
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
                      label: AppLocalizations.of(context)!.name,
                      labelColor: AppColors.gray,
                      controller: _nameController,
                      borderColor: AppColors.gray,
                      prefixIcon: Icons.person,
                      prefixIconColor: AppColors.gray,
                      keyboardType: TextInputType.text,
                      validator: nameValidator,
                      inputColor:
                      changeLang.isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    SizedBox(height: height * 0.01),
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
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      label: AppLocalizations.of(context)!.rePassword,
                      labelColor: AppColors.gray,
                      controller: _rePasswordController,
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
              SizedBox(height: height * 0.01),
              CustomButton(
                text: AppLocalizations.of(context)!.create_account,
                onPressed: () {
                  createAccountValidator();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.alreadyHaveAccount,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                      changeLang.isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  CustomTextButton(txt: AppLocalizations.of(context)!.login,onPressed: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },),
                ],
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
    );
  }

  Future<void> createAccountValidator() async {
    ShowDialogUtils.showLoading(context: context);
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        ShowDialogUtils.hideLoading(context: context);
        ShowDialogUtils.showMessage(
            context: context,
            title: 'Success',
            message: 'Account Created Successfully',
            posActionName: 'Ok',
            posActionFunc: (){
              Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
            }
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ShowDialogUtils.hideLoading(context: context);
          ShowDialogUtils.showMessage(
              context: context,
              title: 'Error',
              message: 'The password provided is too weak.',
              posActionName: 'Ok',
          );
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          ShowDialogUtils.hideLoading(context: context);
          ShowDialogUtils.showMessage(
            context: context,
            title: 'Error',
            message: 'The account already exists for that email.',
            posActionName: 'Ok',
          );
          print('The account already exists for that email.');
        }
      } catch (e) {
        ShowDialogUtils.hideLoading(context: context);
        ShowDialogUtils.showMessage(
          context: context,
          title: 'Error',
          message: e.toString(),
          posActionName: 'Ok',
        );
        print(e);
      }
    }
  }
}
