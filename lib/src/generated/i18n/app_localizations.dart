import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'hello'**
  String get hello;

  /// No description provided for @personalize.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalize;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get choose;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'En'**
  String get en;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @ar.
  ///
  /// In en, this message translates to:
  /// **'Ar'**
  String get ar;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @lets_start.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get lets_start;

  /// No description provided for @find_event.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get find_event;

  /// No description provided for @dive.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get dive;

  /// No description provided for @effortless.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get effortless;

  /// No description provided for @take.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get take;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get connect;

  /// No description provided for @make.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get make;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get welcome;

  /// No description provided for @john.
  ///
  /// In en, this message translates to:
  /// **'John Safwat'**
  String get john;

  /// No description provided for @cairo.
  ///
  /// In en, this message translates to:
  /// **'Cairo , Egypt'**
  String get cairo;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get love;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @birthDay.
  ///
  /// In en, this message translates to:
  /// **'BirthDay'**
  String get birthDay;

  /// No description provided for @meeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meeting;

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// No description provided for @workshop.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get workshop;

  /// No description provided for @exhibition.
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get exhibition;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @eating.
  ///
  /// In en, this message translates to:
  /// **'Eating'**
  String get eating;

  /// No description provided for @book_club.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get book_club;

  /// No description provided for @search_for.
  ///
  /// In en, this message translates to:
  /// **'Search For Event'**
  String get search_for;

  /// No description provided for @twenty_one.
  ///
  /// In en, this message translates to:
  /// **'21'**
  String get twenty_one;

  /// No description provided for @nov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get nov;

  /// No description provided for @this_is_birthday.
  ///
  /// In en, this message translates to:
  /// **'This is a Birthday Party '**
  String get this_is_birthday;

  /// No description provided for @create_event.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get create_event;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @event_title.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get event_title;

  /// No description provided for @event_description.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get event_description;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @empty_field.
  ///
  /// In en, this message translates to:
  /// **'Please fill out this field'**
  String get empty_field;

  /// No description provided for @event_date.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get event_date;

  /// No description provided for @event_time.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get event_time;

  /// No description provided for @choose_date.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get choose_date;

  /// No description provided for @choose_time.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get choose_time;

  /// No description provided for @add_event.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get add_event;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rePassword.
  ///
  /// In en, this message translates to:
  /// **'Re Password'**
  String get rePassword;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forget_password;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @doNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t Have Account ?'**
  String get doNotHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account ?'**
  String get alreadyHaveAccount;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login With Google'**
  String get login_with_google;

  /// No description provided for @invalidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email Address'**
  String get invalidEmailAddress;

  /// No description provided for @invalidName.
  ///
  /// In en, this message translates to:
  /// **'Invalid Name'**
  String get invalidName;

  /// No description provided for @passwordShouldBe.
  ///
  /// In en, this message translates to:
  /// **'Password should be more than or equal 8 characters'**
  String get passwordShouldBe;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
