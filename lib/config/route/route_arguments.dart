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

class HomeArguments {
  final String id;
  HomeArguments({required this.id});
}

class OtherUserProfileArguments {
  final String loggedUserId;
  final String otherUserId;
  OtherUserProfileArguments({
    required this.loggedUserId,
    required this.otherUserId,
  });
}
