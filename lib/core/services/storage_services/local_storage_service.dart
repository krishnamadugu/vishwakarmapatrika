import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishwakarmapatrika/core/constants/app_constraints.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';

class SharedPref {
  Future<bool?> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstraints.isUserLoggedIn);
  }

  setLoggedIn(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstraints.isUserLoggedIn, val);
  }

  saveUserData(value) async {
    final prefs = await SharedPreferences.getInstance();
    String userInfo = jsonEncode(value);
    prefs.setString(AppConstraints.userData, userInfo);
  }

  Future<SignInModel?> getUserData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    if (sharedUser.containsKey(AppConstraints.userData) &&
        sharedUser.getString(AppConstraints.userData) != null) {
      Map<String, dynamic> userMap =
          jsonDecode(sharedUser.getString(AppConstraints.userData)!);
      var userInfo = SignInModel.fromJson(userMap);
      return userInfo;
    }
    return null;
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstraints.userData);
    prefs.remove(AppConstraints.isUserLoggedIn);
  }
}
