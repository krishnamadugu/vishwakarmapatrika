import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/api_paths.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_constraints.dart';

class FindPartnerDataProvider {
  Future<String> getAllBrideProfiles() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        Map<String, String>? headerOptions = {
          ApiConstants.kContentType: ApiConstants.kContentTypeVal,
          ApiConstants.kAccept: ApiConstants.kAcceptVal,
          ApiConstants.kAuthorization: dotenv.get(AppConstraints.bearerToken),
        };
        final res = await http.get(
          Uri.parse(ApiPaths.getAllBridesApiUrl),
          headers: headerOptions,
        );
        return res.body;
      } else {
        throw "Please check your internet connection";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> getAllGroomProfiles() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        Map<String, String>? headerOptions = {
          ApiConstants.kContentType: ApiConstants.kContentTypeVal,
          ApiConstants.kAccept: ApiConstants.kAcceptVal,
          ApiConstants.kAuthorization: dotenv.get(AppConstraints.bearerToken),
        };
        final res = await http.get(
          Uri.parse(ApiPaths.getAllGroomsApiUrl),
          headers: headerOptions,
        );
        return res.body;
      } else {
        throw "Please check your internet connection";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
