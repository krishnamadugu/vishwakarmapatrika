import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/about_us_model.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/our_teams_model.dart';

//part of 'AboutUs_bloc.dart';
sealed class AboutUsState {}

final class AboutUsInitialState extends AboutUsState {}

final class AboutUsLoadingState extends AboutUsState {}

final class AboutUsSuccessState extends AboutUsState {
  final AboutUsModel getAboutUsDetails;
  final OurTeamsModel getOurTeamDetails;
  AboutUsSuccessState({
    required this.getAboutUsDetails,
    required this.getOurTeamDetails,
  });
}

final class AboutUsFailureState extends AboutUsState {
  final String errorMsg;
  AboutUsFailureState({required this.errorMsg});
}
