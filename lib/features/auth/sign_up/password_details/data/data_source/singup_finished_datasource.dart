import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../../../core/constants/api_paths.dart';
import '../../../../../../core/constants/app_constants.dart';

class SignUpDataProvider {
  Future<Map<String, dynamic>> finishSignUp() async {
    var formData = dio.FormData.fromMap(userSignUpData);
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        final res = await dio.Dio().post(
          ApiPaths.signUpApiUrl,
          data: formData,
        );
        return res.data;
      } else {
        throw "Please check your internet connection";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
