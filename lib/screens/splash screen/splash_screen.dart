import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers/my_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences pref;
  late MyUserProvider myUserProvider;

  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    pref = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 4));
    // pref.setBool("onboarding_done",false);
    bool onboardingDone = pref.getBool("onboarding_done") ?? false;

    if (kDebugMode) {
      print(pref.getBool("onboarding_done"));
    }

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        onboardingDone
            ? myUserProvider.login
                ? RouteNames.homeScreen
                : RouteNames.login
            : RouteNames.pickTheme,
      );
      // pref.setBool("onboarding_done", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    myUserProvider = Provider.of<MyUserProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(flex: 2, child: Image.asset('assets/img/Logo.png')),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/img/branding img.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
