import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TempUserContactModel extends Equatable {
  late String mobileNum;
  late String emailAddress;
  late String fullAddress;
  late String stateName;
  late String cityName;

  TempUserContactModel({
    this.mobileNum = "",
    this.emailAddress = "",
    this.fullAddress = "",
    this.stateName = "",
    this.cityName = "",
  });

  TempUserContactModel copyWith({
    String? mobileNum,
    String? emailAddress,
    String? fullAddress,
    String? stateName,
    String? cityName,
  }) {
    return TempUserContactModel(
      mobileNum: mobileNum ?? this.mobileNum,
      emailAddress: emailAddress ?? this.emailAddress,
      fullAddress: fullAddress ?? this.fullAddress,
      stateName: stateName ?? this.stateName,
      cityName: cityName ?? this.cityName,
    );
  }

  @override
  List<Object> get props => [
        mobileNum,
        emailAddress,
        fullAddress,
        stateName,
        cityName,
      ];
}
