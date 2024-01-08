import 'dart:convert';
import 'package:flutter/material.dart';
import '../data_source/singup_finished_datasource.dart';

class SignUpFinishedRepo {
  final SignUpDataProvider signUpDataProvider;
  SignUpFinishedRepo({
    required this.signUpDataProvider,
  });

  Future<bool> postSignUpAPi() async {
    try {
      final signUpData = await signUpDataProvider.finishSignUp();
      if (signUpData['status'] != 1) {
        debugPrint('${signUpData['message']}');
        throw '${signUpData['message']}';
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
