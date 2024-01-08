class Regex {
  static const String passwordRegexExp =
      r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}
