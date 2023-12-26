import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../model/temp_user_family_model.dart';

class SignUpFamilyCubit extends Cubit<TempUserFamilyModel> {
  SignUpFamilyCubit() : super(TempUserFamilyModel());

  void userFatherName(String userFatherName) {
    emit(state.copyWith(fatherName: userFatherName));
    debugPrint(state.fatherName.toString());
  }

  void userMotherName(String userMotherName) {
    emit(state.copyWith(motherName: userMotherName));
    debugPrint(state.motherName.toString());
  }

  void userMarriedBrothersCount(String userMarriedBrothersCount) {
    emit(state.copyWith(marriedBrothersCount: userMarriedBrothersCount));
    debugPrint(state.marriedBrothersCount.toString());
  }

  void userUnMarriedBrothersCount(String userUnMarriedBrothersCount) {
    emit(state.copyWith(unMarriedBrothersCount: userUnMarriedBrothersCount));
    debugPrint(state.unMarriedBrothersCount.toString());
  }

  void userMarriedSistersCount(String userMarriedSistersCount) {
    emit(state.copyWith(marriedSistersCount: userMarriedSistersCount));
    debugPrint(state.marriedSistersCount.toString());
  }

  void userUnMarriedSistersCount(String userUnMarriedSistersCount) {
    emit(state.copyWith(unMarriedSistersCount: userUnMarriedSistersCount));
    debugPrint(state.unMarriedSistersCount.toString());
  }

  void signUpFamilyValidation(BuildContext context) {
    if (!(state.fatherName.isEmpty || state.motherName.isEmpty)) {
      if (state.marriedBrothersCount.isEmpty) {
        showToastMsg(AppStrings.txtRequestMarriedBroCount);
      } else if (state.marriedSistersCount.isEmpty) {
        showToastMsg(AppStrings.txtRequestMarriedSisCount);
      } else if (state.unMarriedBrothersCount.isEmpty) {
        showToastMsg(AppStrings.txtRequestUnMarriedBroCount);
      } else if (state.unMarriedSistersCount.isEmpty) {
        showToastMsg(AppStrings.txtRequestUnMarriedSisCount);
      } else {
        Navigator.pushNamed(context, AppRoutes.signUpScreen3);
      }
    }
  }
}