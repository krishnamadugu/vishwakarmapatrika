import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/model/form_field_list_model.dart';

class BottomNavArguments {
  final SignInModel signInModel;
  BottomNavArguments(this.signInModel);
}

class BasicSignUpDetailsArguments {
  final FormFieldListDataModel formFieldListDataModel;
  BasicSignUpDetailsArguments(this.formFieldListDataModel);
}
