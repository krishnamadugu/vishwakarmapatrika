import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/model/temp_user_profile_model.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';

class SignupBasicCubit extends Cubit<TempUserProfileModel> {
  SignupBasicCubit() : super(TempUserProfileModel());

  void userName(String userName) {
    emit(state.copyWith(name: userName));
    debugPrint(state.name.toString());
  }

  void userBirthPlace(String userBirthPlace) {
    emit(state.copyWith(birthPlace: userBirthPlace));
    debugPrint(state.birthPlace.toString());
  }

  void userOccupation(String userOccupation) {
    emit(state.copyWith(enterOccupation: userOccupation));
    debugPrint(state.enterOccupation.toString());
  }

  void userHobbies(String userHobbies) {
    emit(state.copyWith(enterHobbies: userHobbies));
    debugPrint(state.enterHobbies.toString());
  }

  void userImg(String imgPath) {
    emit(state.copyWith(imgUrl: imgPath));
    debugPrint(state.imgUrl.toString());
  }

  void userSubCaste(String userSubCaste) {
    emit(state.copyWith(subCaste: userSubCaste));
    debugPrint(state.subCaste.toString());
  }

  void userSelectGender(String userSelectGender) {
    emit(state.copyWith(gender: userSelectGender));
    debugPrint(state.gender.toString());
  }

  void userDOB(String userDOB) {
    emit(state.copyWith(dob: userDOB));
    debugPrint(state.dob.toString());
  }

  void userBirthTime(String birthTime) {
    emit(state.copyWith(birthTime: birthTime));
    debugPrint(state.dob.toString());
  }

  void userManglikStatus(String manglikStatus) {
    emit(state.copyWith(manglikStatus: manglikStatus));
    debugPrint(state.manglikStatus);
  }

  void userMartialStatus(String martialStatus) {
    emit(state.copyWith(maritalStatus: martialStatus));
    debugPrint(state.maritalStatus);
  }

  void userCreatedBy(String createdBy) {
    emit(state.copyWith(createdBy: createdBy));
    debugPrint(state.createdBy.toString());
  }

  void userEducationLevel(String education) {
    emit(state.copyWith(education: education));
    debugPrint(state.education.toString());
  }

  void signUpBasicValidation(BuildContext context) {
    if ((state.name.isEmpty ||
        state.birthPlace.isEmpty ||
        state.enterOccupation.isEmpty ||
        state.enterHobbies.isEmpty)) {
      if (state.subCaste.isEmpty) {
        showToastMsg(AppStrings.txtRequestSubCaste);
      } else if (state.gender.isEmpty) {
        showToastMsg(AppStrings.txtRequestGender);
      } else if (state.dob.isEmpty) {
        showToastMsg(AppStrings.txtRequestDOB);
      } else if (state.birthTime.isEmpty) {
        showToastMsg(AppStrings.txtRequestBirthTime);
      } else if (state.manglikStatus.isEmpty) {
        showToastMsg(AppStrings.txtRequestManglikStatus);
      } else if (state.maritalStatus.isEmpty) {
        showToastMsg(AppStrings.txtRequestMaritalStatus);
      } else if (state.createdBy.isEmpty) {
        showToastMsg(AppStrings.txtRequestCreatedBy);
      } else if (state.education.isEmpty) {
        showToastMsg(AppStrings.txtRequestEducation);
      } else if (state.imgUrl.isEmpty) {
        showToastMsg(AppStrings.txtRequestImgUrl);
      }
    } else {
      Navigator.pushNamed(context, AppRoutes.signUpScreen2);
    }
  }
}
