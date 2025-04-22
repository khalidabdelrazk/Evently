import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/providers/change_lang.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:evently/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
    create: (context) => ChangeLang(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLang>(context);
    return MaterialApp(
      theme: langProvider.theme.copyWith(
        textTheme: langProvider.isEnglish? GoogleFonts.interTextTheme() : GoogleFonts.ibmPlexSansArabicTextTheme(),
      ),
      onGenerateTitle: (context) => AppLocalizations.of(context)!.hello,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: langProvider.locale,
      routes: Routes.myAppRoutes,
      initialRoute: RouteNames.splashScreen,
      // home: OnboardingScreen(),
    );
  }
}
