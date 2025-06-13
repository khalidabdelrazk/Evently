import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app theme/app_theme.dart';

class ChangeLang with ChangeNotifier {
  bool _isEnglish = true;
  bool _isDark = false;

  bool get isEnglish => _isEnglish;
  bool get isDark => _isDark;

  Locale get locale => _isEnglish ? Locale('en') : Locale('ar');
  ThemeData get theme => _isDark ? ThemeInit.dark : ThemeInit.light;

  ChangeLang() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isEnglish = prefs.getBool('isEnglish') ?? true;
    _isDark = prefs.getBool('isDark') ?? false; // default to Light mode
    notifyListeners();
  }

  Future<void> toggleLang() async {
    _isEnglish = !_isEnglish;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEnglish', _isEnglish);
    notifyListeners();
  }

  Future<void> setEnglish() async {
    final prefs = await SharedPreferences.getInstance();
    final isEnglish = prefs.getBool('isEnglish') ?? true;
    if (isEnglish) {
      return;
    }
    _isEnglish = true;
    await prefs.setBool('isEnglish', true);
    notifyListeners();
  }

  Future<void> setArabic() async {
    final prefs = await SharedPreferences.getInstance();
    final isEnglish = prefs.getBool('isEnglish') ?? true;
    if (!isEnglish) {
      return;
    }
    _isEnglish = false;
    await prefs.setBool('isEnglish', false);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDark);
    notifyListeners();
  }

  Future<void> setDark() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    if (isDark) {
      return;
    }
    _isDark = true;
    await prefs.setBool('isDark', true);
    notifyListeners();
  }

  Future<void> setLight() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    if (!isDark) {
      return;
    }
    _isDark = false;
    await prefs.setBool('isDark', false);
    notifyListeners();
  }
}
