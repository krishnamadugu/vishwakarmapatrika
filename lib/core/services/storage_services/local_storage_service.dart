import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishwakarmapatrika/core/constants/app_constraints.dart';

class SharedPref {
  Future<bool?> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstraints.isUserLoggedIn);
  }

  setLoggedIn(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstraints.isUserLoggedIn, val);
  }
}
