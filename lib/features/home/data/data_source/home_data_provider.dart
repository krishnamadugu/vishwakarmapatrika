import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vishwakarmapatrika/core/constants/api_constants.dart';
import 'package:vishwakarmapatrika/core/constants/api_paths.dart';
import 'package:vishwakarmapatrika/core/constants/app_constraints.dart';
import '../../../../../../core/constants/app_constants.dart';

class HomeScreenDataProvider {
  Future<String> getAllProfiles() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        Map<String, String>? headerOptions = {
          ApiConstants.kContentType: ApiConstants.kContentTypeVal,
          ApiConstants.kAccept: ApiConstants.kAcceptVal,
          ApiConstants.kAuthorization: dotenv.get(AppConstraints.bearerToken),
        };
        final res = await http.get(
          Uri.parse(ApiPaths.getAllProfilesApiUrl),
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
