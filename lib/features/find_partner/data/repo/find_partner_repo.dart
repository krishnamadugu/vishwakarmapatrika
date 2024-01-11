import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_strings.dart';
import '../../model/get_all_partners_model.dart';
import '../data_provider/find_partner_data_provider.dart';

class FindPartnerRepository {
  final FindPartnerDataProvider findPartnerScreenDataProvider;
  FindPartnerRepository({
    required this.findPartnerScreenDataProvider,
  });

  Future<GetAllPartnerDetailsModel> getRequiredGenderProfilesData(
      {required String searchingFor}) async {
    try {
      final profilesListData = jsonDecode(searchingFor == AppStrings.txtGroom
          ? await findPartnerScreenDataProvider.getAllGroomProfiles()
          : await findPartnerScreenDataProvider.getAllBrideProfiles());
      if (profilesListData['status'] != 1) {
        debugPrint('${profilesListData['message']}');
        throw '${profilesListData['message']}';
      }
      return GetAllPartnerDetailsModel.fromJson(profilesListData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
