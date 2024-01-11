part of 'find_partner_bloc.dart';

sealed class FindPartnerState {}

final class FindPartnerInitialState extends FindPartnerState {}

final class FindPartnerLoadingState extends FindPartnerState {}

final class FindPartnerFailureState extends FindPartnerState {
  final String errorMsg;
  FindPartnerFailureState({required this.errorMsg});
}

final class FindPartnerSuccessState extends FindPartnerState {
  final GetAllPartnerDetailsModel getAllPartnerDetailsModel;
  FindPartnerSuccessState({required this.getAllPartnerDetailsModel});
}
