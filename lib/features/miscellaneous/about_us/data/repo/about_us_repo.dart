import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/about_us_model.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/our_teams_model.dart';
import '../data_source/about_us_data_provider.dart';

class AboutUsRepository {
  final AboutUsScreenDataProvider aboutUsScreenDataProvider;
  AboutUsRepository({
    required this.aboutUsScreenDataProvider,
  });

  Future<AboutUsModel> getAboutUsDetails() async {
    try {
      final aboutUsData =
          jsonDecode(await aboutUsScreenDataProvider.getAboutUs());
      if (aboutUsData['status'] != 1) {
        debugPrint('${aboutUsData['message']}');
        throw '${aboutUsData['message']}';
      }
      return AboutUsModel.fromJson(aboutUsData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<OurTeamsModel> getOurTeamsDetails() async {
    try {
      final ourTeamsData =
          jsonDecode(await aboutUsScreenDataProvider.getOurTeams());
      if (ourTeamsData['status'] != 1) {
        debugPrint('${ourTeamsData['message']}');
        throw '${ourTeamsData['message']}';
      }
      return OurTeamsModel.fromJson(ourTeamsData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
