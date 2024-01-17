import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vishwakarmapatrika/core/constants/api_paths.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constraints.dart';

class OtherUserProfileDataProvider {
  Future<Map<String, dynamic>> getOtherUserData(
      {required String loggedUserId, required String id}) async {
    var formData = dio.FormData.fromMap({
      'userId': loggedUserId,
      'password': id,
    });

    Map<String, String>? headerOptions = {
      ApiConstants.kContentType: ApiConstants.kMultiPartContentTypeVal,
      ApiConstants.kAccept: ApiConstants.kAcceptVal,
      ApiConstants.kAuthorization: dotenv.get(AppConstraints.bearerToken),
    };

    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        final res = await dio.Dio().post(
          ApiPaths.getProfileDetailsApiUrl,
          data: formData,
          options: dio.Options(headers: headerOptions),
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
