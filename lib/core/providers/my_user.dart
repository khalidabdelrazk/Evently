// import 'package:evently/core/model/my_user.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyUserProvider extends ChangeNotifier {
//   MyUser? _myUser;
//   bool _login = false;
//   SharedPreferences? _prefs;
//
//   MyUser? get myUser => _myUser;
//   bool get login => _login;
//
//   MyUserProvider() {
//     _loadPreference();
//   }
//
//   Future<void> _loadPreference() async {
//     _prefs = await SharedPreferences.getInstance();
//     _login = _prefs?.getBool('isLogged') ?? false;
//     notifyListeners();
//   }
//
//   void updateUser(MyUser? value) {
//     _myUser = value;
//     notifyListeners();
//   }
//
//   void setLoginStatus(bool value) {
//     _login = value;
//     _prefs?.setBool('isLogged', value);
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'package:evently/core/model/my_user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUserProvider extends ChangeNotifier {
  MyUser? _myUser;
  bool _login = false;
  SharedPreferences? _prefs;

  MyUser? get myUser => _myUser;
  bool get login => _login;

  MyUserProvider() {
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    _prefs = await SharedPreferences.getInstance();
    _login = _prefs?.getBool('isLogged') ?? false;

    // Restore user data if available
    String? userJson = _prefs?.getString('myUser');
    if (userJson != null) {
      _myUser = MyUser.toObject(json.decode(userJson));
    }

    notifyListeners();
  }

  void updateUser(MyUser? value) {
    _myUser = value;
    if (value != null) {
      _prefs?.setString('myUser', json.encode(value.toJson()));
    } else {
      _prefs?.remove('myUser');
    }
    notifyListeners();
  }

  void setLoginStatus(bool value) {
    _login = value;
    _prefs?.setBool('isLogged', value);
    notifyListeners();
  }

  void logout() {
    _myUser = null;
    _login = false;
    _prefs?.remove('isLogged');
    _prefs?.remove('myUser');
    notifyListeners();
  }
}
