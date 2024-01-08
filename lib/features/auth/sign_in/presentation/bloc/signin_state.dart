part of 'signin_bloc.dart';

sealed class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final SignInModel signInModel;
  SignInSuccessState({required this.signInModel});
}

final class SignInFailureState extends SignInState {
  final String errorMsg;
  SignInFailureState(this.errorMsg);
}

final class GetFormFieldDataState extends SignInState {
  final FormFieldListDataModel formFieldListDataModel;
  GetFormFieldDataState(this.formFieldListDataModel);
}
