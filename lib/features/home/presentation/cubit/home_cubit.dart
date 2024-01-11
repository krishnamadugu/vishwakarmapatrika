import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';

class HomeCubit extends Cubit<TempListMode> {
  HomeCubit() : super(TempListMode());

  void onFirstContainerTapped(bool val) {
    emit(state.copyWith(isFirstSelected: val));
    debugPrint(state.toString());
  }

  void onSecondContainerTapped(bool val) {
    emit(state.copyWith(isSecondSelected: val));
    debugPrint(state.toString());
  }
}
