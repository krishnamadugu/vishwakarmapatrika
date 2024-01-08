import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';

class HomeCubit extends Cubit<TempListMode> {
  HomeCubit() : super(TempListMode());

  void onContainerTapped(bool val) {
    emit(state.copyWith(isSelected: val));
    debugPrint(state.toString());
  }
}

class HomeOverallCubit extends Cubit<List<TempListMode>> {
  HomeOverallCubit() : super([]);

  void checkUncheckCart(int index) {
    if (!state[index].isSelected) {
      state[index].isSelected = !state[index].isSelected;
      emit(state);
    } else {
      // state.items?.elementAt(index).isSelected =
      //     !state.[index].isSelected;
      // emit(state.copyWith(items: state.items));
    }
  }
}
