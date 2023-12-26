import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordObscureCubit extends Cubit<bool> {
  PasswordObscureCubit() : super(false);

  void updateObscureVal(bool val) {
    emit(val);
    debugPrint(state.toString());
  }
}
