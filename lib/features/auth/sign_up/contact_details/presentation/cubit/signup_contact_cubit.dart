import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_constants.dart';
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

  void userAboutSection(String userAboutUs) {
    emit(state.copyWith(aboutSection: userAboutUs));
    debugPrint(state.aboutSection.toString());
  }

  void userLocation(String userLocation) {
    emit(state.copyWith(location: userLocation));
    debugPrint(state.location.toString());
  }

  void signUpContactValidation(BuildContext context) {
    if (!(state.mobileNum.isEmpty ||
        state.emailAddress.isEmpty ||
        state.fullAddress.isEmpty ||
        state.cityName.isEmpty ||
        state.location.isEmpty)) {
      if (state.stateName.isEmpty) {
        showToastMsg(AppStrings.txtRequestStateName);
      } else {
        userSignUpData['email'] = state.emailAddress;
        userSignUpData['mobile'] = state.mobileNum;
        userSignUpData['address'] = state.fullAddress;
        userSignUpData['city'] = state.cityName;
        userSignUpData['state'] = state.stateName;
        userSignUpData['about_us'] = state.aboutSection;
        userSignUpData['location'] = state.location;
        Navigator.pushNamed(context, AppRoutes.signUpScreen4);
      }
    }
  }
}
