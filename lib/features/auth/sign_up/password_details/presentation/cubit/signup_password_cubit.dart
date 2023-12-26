import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../model/temp_signup_password_model.dart';

class SignUpPasswordCubit extends Cubit<SignUpPasswordModel> {
  SignUpPasswordCubit() : super(SignUpPasswordModel());
  void userEnterPassword(String userEnterPassword) {
    emit(state.copyWith(passwordTxt: userEnterPassword));
    debugPrint(state.passwordTxt.toString());
  }

  void userConfirmPassword(String userConfirmPassword) {
    emit(state.copyWith(confirmPasswordTxt: userConfirmPassword));
    debugPrint(state.confirmPasswordTxt.toString());
  }

  void updateObsTxtVal(bool obsVal) {
    emit(state.copyWith(obsTxtValue: obsVal));
    debugPrint(state.obsTxtValue.toString());
  }
}
