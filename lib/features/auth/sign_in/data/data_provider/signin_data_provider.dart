import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../../core/constants/app_constants.dart';

class SigninDataProvider {
  Future<Map<String, dynamic>> userSignin(
      {required String username, required String password}) async {
    var formData = dio.FormData.fromMap({
      'userId': username,
      'password': password,
    });

    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        final res = await dio.Dio().post(
          "http://vishwakarmapatrika.com/backend/api/login",
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
