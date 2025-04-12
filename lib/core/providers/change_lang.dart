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
    _loadPreferences(); // Load preferences when the class is instantiated
  }

  // Load preferences from SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isEnglish = prefs.getBool('isEnglish') ?? true; // Default to true (English)
    _isDark = prefs.getBool('isDark') ?? true; // Default to true (Dark mode)
    notifyListeners(); // Notify listeners after loading preferences
  }

  // Toggle language and save the preference
  Future<void> toggleLang() async {
    _isEnglish = !_isEnglish;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEnglish', _isEnglish); // Save language preference
    notifyListeners();
  }

  // Toggle theme and save the preference
  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDark); // Save theme preference
    notifyListeners();
  }
}
