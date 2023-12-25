import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TempUserProfileModel extends Equatable {
  late String imgUrl;
  late String name;
  late String subCaste;
  late String gender;
  late String dob;
  late String birthTime;
  late String birthPlace;
  late String manglikStatus;
  late String maritalStatus;
  late String createdBy;
  late String education;
  late String enterOccupation;
  late String enterHobbies;

  TempUserProfileModel({
    this.imgUrl = '',
    this.name = '',
    this.subCaste = '',
    this.gender = '',
    this.dob = '',
    this.birthTime = '',
    this.birthPlace = '',
    this.manglikStatus = '',
    this.maritalStatus = '',
    this.createdBy = '',
    this.education = '',
    this.enterOccupation = '',
    this.enterHobbies = '',
  });

  TempUserProfileModel copyWith({
    String? imgUrl,
    String? name,
    String? subCaste,
    String? gender,
    String? dob,
    String? birthTime,
    String? birthPlace,
    String? manglikStatus,
    String? maritalStatus,
    String? createdBy,
    String? education,
    String? enterOccupation,
    String? enterHobbies,
  }) {
    return TempUserProfileModel(
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      subCaste: subCaste ?? this.subCaste,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      birthTime: birthTime ?? this.birthTime,
      birthPlace: birthPlace ?? this.birthPlace,
      manglikStatus: manglikStatus ?? this.manglikStatus,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      createdBy: createdBy ?? this.createdBy,
      education: education ?? this.education,
      enterOccupation: enterOccupation ?? this.enterOccupation,
      enterHobbies: enterHobbies ?? this.enterHobbies,
    );
  }

  @override
  String toString() {
    return 'TempUserProfileModel{imgUrl: $imgUrl, name: $name, subCaste: $subCaste, gender: $gender, dob: $dob, birthTime: $birthTime, birthPlace: $birthPlace, manglikStatus: $manglikStatus, maritalStatus: $maritalStatus, createdBy: $createdBy, education: $education, enterOccupation: $enterOccupation, enterHobbies: $enterHobbies}';
  }

  @override
  List<Object> get props => [
        imgUrl,
        name,
        subCaste,
        gender,
        dob,
        birthTime,
        birthPlace,
        manglikStatus,
        maritalStatus,
        createdBy,
        education,
        enterOccupation,
        enterHobbies,
      ];
}
