import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class SignUpPasswordModel extends Equatable {
  late String passwordTxt;
  late String confirmPasswordTxt;
  late bool obsTxtValue;

  SignUpPasswordModel({
    this.passwordTxt = "",
    this.confirmPasswordTxt = "",
    this.obsTxtValue = false,
  });

  SignUpPasswordModel copyWith({
    String? passwordTxt,
    String? confirmPasswordTxt,
    bool? obsTxtValue,
  }) {
    return SignUpPasswordModel(
      passwordTxt: passwordTxt ?? this.passwordTxt,
      confirmPasswordTxt: confirmPasswordTxt ?? this.confirmPasswordTxt,
      obsTxtValue: obsTxtValue ?? this.obsTxtValue,
    );
  }

  @override
  List<Object?> get props => [
        passwordTxt,
        confirmPasswordTxt,
        obsTxtValue,
      ];

  @override
  String toString() {
    return 'SignUpPasswordModel{passwordTxt: $passwordTxt, confirmPasswordTxt: $confirmPasswordTxt, obsTxtValue: $obsTxtValue}';
  }
}
