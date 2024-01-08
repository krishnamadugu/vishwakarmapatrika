part of 'signin_bloc.dart';

sealed class SignInEvent {}

class SignInUserEvent extends SignInEvent {
  final String userName;
  final String password;

  SignInUserEvent({required this.userName, required this.password});
}

class FormFieldDataEvent extends SignInEvent {}
