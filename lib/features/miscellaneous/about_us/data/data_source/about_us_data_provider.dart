import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:vishwakarmapatrika/core/constants/api_constants.dart';
import 'package:vishwakarmapatrika/core/constants/api_paths.dart';
import '../../../../../../core/constants/app_constants.dart';

class AboutUsScreenDataProvider {
  Future<String> getAboutUs() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        Map<String, String>? headerOptions = {
          ApiConstants.kContentType: ApiConstants.kContentTypeVal,
          ApiConstants.kAccept: ApiConstants.kAcceptVal,
        };
        final res = await http.get(
          Uri.parse(ApiPaths.getAboutUsDetailsApiUrl),
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

  Future<String> getOurTeams() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        Map<String, String>? headerOptions = {
          ApiConstants.kContentType: ApiConstants.kContentTypeVal,
          ApiConstants.kAccept: ApiConstants.kAcceptVal,
        };
        final res = await http.get(
          Uri.parse(ApiPaths.getOurTeamsApiUrl),
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
