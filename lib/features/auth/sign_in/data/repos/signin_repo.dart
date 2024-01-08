import 'package:vishwakarmapatrika/features/auth/sign_in/data/data_provider/signin_data_provider.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';

class SingInRepository {
  final SigninDataProvider signinDataProvider;
  SingInRepository({
    required this.signinDataProvider,
  });

  Future<SignInModel> userSignIn(
      {required String userName, required String password}) async {
    try {
      final signInData = await signinDataProvider.userSignin(
          username: userName, password: password);
      if (signInData['status'] != 1) {
        throw '${signInData['message']}';
      }
      return SignInModel.fromJson(signInData);
    } catch (e) {
      throw e.toString();
    }
  }
}
