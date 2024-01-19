part of 'other_profile_bloc.dart';

sealed class OtherProfileState {}

final class OtherProfileInitialState extends OtherProfileState {}

final class OtherProfileLoadingState extends OtherProfileState {}

final class OtherProfileFailureState extends OtherProfileState {
  final String errorMsg;
  OtherProfileFailureState({required this.errorMsg});
}

final class OtherProfileSuccessState extends OtherProfileState {
  final OtherProfileModel getOtherUserProfileData;
  OtherProfileSuccessState({required this.getOtherUserProfileData});
}
