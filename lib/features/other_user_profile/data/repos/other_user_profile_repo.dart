import 'package:flutter/cupertino.dart';
import '../../model/other_user_profile_model.dart';
import '../data_provider/other_user_profile_data_provider.dart';

//ignore: must_be_immutable
class OtherUserProfileRepository {
  final OtherUserProfileDataProvider otherUserProfileDataProvider;
  OtherUserProfileRepository({
    required this.otherUserProfileDataProvider,
  });

  Future<OtherProfileModel> getOtherUserProfileData(
      {required String loggedUserId, required String id}) async {
    try {
      final otherProfileData = await otherUserProfileDataProvider
          .getOtherUserData(loggedUserId: loggedUserId, id: id);
      if (otherProfileData['status'] != 1) {
        debugPrint('${otherProfileData['message']}');
        throw '${otherProfileData['message']}';
      }
      return OtherProfileModel.fromJson(otherProfileData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
