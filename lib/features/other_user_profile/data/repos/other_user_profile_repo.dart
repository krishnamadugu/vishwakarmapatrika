import 'dart:convert';
import 'package:flutter/material.dart';

import '../data_provider/other_user_profile_data_provider.dart';

class OtherUserProfileRepository {
  final OtherUserProfileDataProvider otherUserProfileDataProvider;
  OtherUserProfileRepository({
    required this.otherUserProfileDataProvider,
  });

  // Future<GetAllProfilesModel> getOtherUserProfileData() async {
  //   try {
  //     final profilesListData =
  //         jsonDecode(await homeScreenDataProvider.getAllProfiles());
  //     if (profilesListData['status'] != 1) {
  //       debugPrint('${profilesListData['message']}');
  //       throw '${profilesListData['message']}';
  //     }
  //     return GetAllProfilesModel.fromJson(profilesListData);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     throw e.toString();
  //   }
  // }
}
