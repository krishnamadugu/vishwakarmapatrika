import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';
import '../../../sign_up/basic_details/data/repo/form_filed_list_repo.dart';
import '../../../sign_up/basic_details/model/form_field_list_model.dart';
import '../../data/repos/signin_repo.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SingInRepository singInRepository;
  final FormFieldListRepository formFieldListRepository;
  SignInBloc(this.singInRepository, this.formFieldListRepository)
      : super(SignInInitialState()) {
    on<SignInUserEvent>(_signInUser);
    on<FormFieldDataEvent>(_getFormFieldData);
  }

  void _signInUser(SignInUserEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoadingState());
      final userData = await singInRepository.userSignIn(
          userName: event.userName, password: event.password);
      emit(SignInSuccessState(signInModel: userData));
    } catch (e) {
      emit(SignInFailureState(e.toString()));
    }
  }

  void _getFormFieldData(
      FormFieldDataEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoadingState());
      final formData = await formFieldListRepository.getFormData();
      emit(GetFormFieldDataState(formData));
    } catch (e) {
      emit(SignInFailureState(e.toString()));
    }
  }
}
