import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TempUserFamilyModel extends Equatable {
  late String fatherName;
  late String motherName;
  late String marriedBrothersCount;
  late String unMarriedBrothersCount;
  late String marriedSistersCount;
  late String unMarriedSistersCount;

  TempUserFamilyModel({
    this.fatherName = '',
    this.motherName = '',
    this.marriedBrothersCount = '',
    this.unMarriedBrothersCount = '',
    this.marriedSistersCount = '',
    this.unMarriedSistersCount = '',
  });

  TempUserFamilyModel copyWith({
    String? fatherName,
    String? motherName,
    String? marriedBrothersCount,
    String? unMarriedBrothersCount,
    String? marriedSistersCount,
    String? unMarriedSistersCount,
  }) {
    return TempUserFamilyModel(
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      marriedBrothersCount: marriedBrothersCount ?? this.marriedBrothersCount,
      unMarriedBrothersCount:
          unMarriedBrothersCount ?? this.unMarriedBrothersCount,
      marriedSistersCount: marriedSistersCount ?? this.marriedSistersCount,
      unMarriedSistersCount:
          unMarriedSistersCount ?? this.unMarriedSistersCount,
    );
  }

  @override
  String toString() {
    return 'TempUserFamilyModel{fatherName: $fatherName, motherName: $motherName, marriedBrothersCount: $marriedBrothersCount, unMarriedBrothersCount: $unMarriedBrothersCount, marriedSistersCount: $marriedSistersCount, unMarriedSistersCount: $unMarriedSistersCount}';
  }

  @override
  List<Object> get props => [
        fatherName,
        motherName,
        marriedBrothersCount,
        unMarriedBrothersCount,
        marriedSistersCount,
        unMarriedSistersCount,
      ];
}
