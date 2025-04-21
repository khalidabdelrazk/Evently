import 'package:evently/core/routes/route_names.dart';
import 'package:evently/screens/auth/forget_password.dart';
import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/home%20screen/home_screen.dart';
import 'package:evently/screens/new%20event/new_event.dart';
import 'package:evently/screens/onboarding%20screen/on_boarding_builder.dart';
import 'package:evently/screens/pick%20theme%20and%20lang%20screen/pick_lang_theme.dart';
import 'package:evently/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../screens/auth/create_account.dart';

class Routes{
  static Map<String, Widget Function(BuildContext)> myAppRoutes = {
    RouteNames.splashScreen : (_) => SplashScreen(),
    RouteNames.pickTheme : (_) => PickLangTheme(),
    RouteNames.onBoarding : (_) => OnBoardingBuilder(),
    RouteNames.homeScreen : (_) => HomeScreen(),
    RouteNames.newEvent : (_) => NewEvent(),
    RouteNames.login : (_) => Login(),
    RouteNames.forgetPassword : (_) => ForgetPassword(),
    RouteNames.createAccount : (_) => CreateAccount(),
  };
}