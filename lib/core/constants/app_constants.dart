import 'package:connectivity_plus/connectivity_plus.dart';

import '../services/storage_services/local_storage_service.dart';

enum AppTheme { light, dark }

SharedPref sharedPref = SharedPref();
Connectivity connectivity = Connectivity();

Map<String, dynamic> userSignUpData = {};
