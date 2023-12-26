import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../model/temp_user_contact_model.dart';

class SignUpContactCubit extends Cubit<TempUserContactModel> {
  SignUpContactCubit() : super(TempUserContactModel());

  void userMobileNum(String userMobileNum) {
    emit(state.copyWith(mobileNum: userMobileNum));
    debugPrint(state.mobileNum.toString());
  }

  void userEmailAddress(String userEmailAddress) {
    emit(state.copyWith(emailAddress: userEmailAddress));
    debugPrint(state.emailAddress);
  }

  void userFullAddress(String userFullAddress) {
    emit(state.copyWith(fullAddress: userFullAddress));
    debugPrint(state.fullAddress.toString());
  }

  void userStateName(String userStateName) {
    emit(state.copyWith(stateName: userStateName));
    debugPrint(state.stateName.toString());
  }

  void userCityName(String userCityName) {
    emit(state.copyWith(cityName: userCityName));
    debugPrint(state.cityName.toString());
  }

  void signUpContactValidation(BuildContext context) {
    if (!(state.mobileNum.isEmpty ||
        state.emailAddress.isEmpty ||
        state.fullAddress.isEmpty ||
        state.cityName.isEmpty)) {
      if (state.stateName.isEmpty) {
        showToastMsg(AppStrings.txtRequestStateName);
      } else {
        Navigator.pushNamed(context, AppRoutes.signUpScreen4);
      }
    }
  }
}
