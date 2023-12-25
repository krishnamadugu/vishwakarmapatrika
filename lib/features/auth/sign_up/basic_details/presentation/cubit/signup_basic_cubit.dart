import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/model/temp_user_profile_model.dart';

class SignupBasicCubit extends Cubit<TempUserProfileModel> {
  SignupBasicCubit() : super(TempUserProfileModel());

  void userImg(String imgPath) {
    emit(state.copyWith(imgUrl: imgPath));
    debugPrint(state.imgUrl.toString());
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
}
