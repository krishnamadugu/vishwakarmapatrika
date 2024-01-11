import 'package:equatable/equatable.dart';

class TempChoosePartnerModel extends Equatable {
  String selectedPartner;
  TempChoosePartnerModel({required this.selectedPartner});

  TempChoosePartnerModel copyWith({
    final String? selectedPartner,
  }) {
    return TempChoosePartnerModel(
      selectedPartner: selectedPartner ?? this.selectedPartner,
    );
  }

  @override
  List<Object?> get props => [
        selectedPartner,
      ];

  @override
  String toString() {
    return 'TempChoosePartnerModel{selectedPartner: $selectedPartner}';
  }
}
