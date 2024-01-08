import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:vishwakarmapatrika/core/constants/api_paths.dart';

import '../../../../../../core/constants/app_constants.dart';

class FormFieldListDataProvider {
  Future<String> getFormFieldData() async {
    try {
      var event = await connectivity.checkConnectivity();
      if (event != ConnectivityResult.none) {
        final res = await http.get(Uri.parse(ApiPaths.formFiledListApiUrl));
        return res.body;
      } else {
        throw "Please check your internet connection";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
