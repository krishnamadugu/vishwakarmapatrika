import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../../model/get_all_profiles_model.dart';
import '../data_source/home_data_provider.dart';

class HomeRepository {
  final HomeScreenDataProvider homeScreenDataProvider;
  HomeRepository({
    required this.homeScreenDataProvider,
  });

  Future<GetAllProfilesModel> getAllProfilesData() async {
    try {
      final profilesListData =
          jsonDecode(await homeScreenDataProvider.getAllProfiles());
      if (profilesListData['status'] != 1) {
        debugPrint('${profilesListData['message']}');
        throw '${profilesListData['message']}';
      }
      return GetAllProfilesModel.fromJson(profilesListData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
