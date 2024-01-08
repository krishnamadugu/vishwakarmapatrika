import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TempUserContactModel extends Equatable {
  late String mobileNum;
  late String emailAddress;
  late String fullAddress;
  late String stateName;
  late String location;
  late String aboutSection;
  late String cityName;

  TempUserContactModel({
    this.mobileNum = "",
    this.emailAddress = "",
    this.fullAddress = "",
    this.stateName = "",
    this.location = "",
    this.cityName = "",
    this.aboutSection = '',
  });

  TempUserContactModel copyWith({
    String? mobileNum,
    String? emailAddress,
    String? fullAddress,
    String? stateName,
    String? cityName,
    String? location,
    String? aboutSection,
  }) {
    return TempUserContactModel(
      mobileNum: mobileNum ?? this.mobileNum,
      emailAddress: emailAddress ?? this.emailAddress,
      fullAddress: fullAddress ?? this.fullAddress,
      stateName: stateName ?? this.stateName,
      cityName: cityName ?? this.cityName,
      location: location ?? this.location,
      aboutSection: aboutSection ?? this.aboutSection,
    );
  }

  @override
  List<Object> get props => [
        mobileNum,
        emailAddress,
        fullAddress,
        stateName,
        cityName,
        location,
        aboutSection,
      ];
}
