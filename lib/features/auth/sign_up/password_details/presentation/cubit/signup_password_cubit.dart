import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:vishwakarmapatrika/core/utils/shared/shared_widgets.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/theme/app_colors.dart';
import '../../data/repos/signup_finished_repo.dart';
import '../../model/temp_signup_password_model.dart';

class SignUpPasswordCubit extends Cubit<SignUpPasswordModel> {
  final SignUpFinishedRepo signUpFinishedRepo;
  SignUpPasswordCubit(this.signUpFinishedRepo) : super(SignUpPasswordModel());
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

  void signUpUser(BuildContext context) async {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    sharedLoadingIndicatorWidget(
        context, screenHeight, screenWidth, AppColors.primaryColor);
    userSignUpData['image'] = await dio.MultipartFile.fromFile(
      userSignUpData['image'],
      filename: "user_profile",
    );
    try {
      final isUserSignedIn = await signUpFinishedRepo.postSignUpAPi();
      Navigator.pop(context);
      if (isUserSignedIn) {
        if (context.mounted) {
          showToastMsg('signup successful');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.loginScreen,
            (Route<dynamic> route) => false,
          );
        }
      } else {
        showToastMsg("Internal Error");
      }
    } catch (e) {
      showToastMsg(e.toString());
    }
  }
}
