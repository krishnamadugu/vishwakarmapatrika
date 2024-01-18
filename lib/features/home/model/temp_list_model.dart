import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TempListMode extends Equatable {
  late bool isFirstSelected;
  late bool isSecondSelected;
  late bool categoryTapped;
  late int categoryIndexTapped;
  final String labelTxt;
  final List<int>? selectedListIndex;

  TempListMode({
    this.labelTxt = '',
    this.isSecondSelected = false,
    this.isFirstSelected = false,
    this.categoryIndexTapped = 0,
    this.categoryTapped = true,
    this.selectedListIndex,
  });

  TempListMode copyWith({
    bool? isFirstSelected,
    bool? isSecondSelected,
    bool? categoryTapped,
    int? categoryIndexTapped,
    String? labelTxt,
    List<int>? selectedListIndex,
  }) {
    return TempListMode(
      labelTxt: labelTxt ?? this.labelTxt,
      isFirstSelected: isFirstSelected ?? this.isFirstSelected,
      isSecondSelected: isSecondSelected ?? this.isSecondSelected,
      categoryIndexTapped: categoryIndexTapped ?? this.categoryIndexTapped,
      categoryTapped: categoryTapped ?? this.categoryTapped,
      selectedListIndex: selectedListIndex ?? this.selectedListIndex,
    );
  }

  @override
  List<Object?> get props => [
        isFirstSelected,
        isSecondSelected,
        labelTxt,
        categoryTapped,
        categoryIndexTapped,
        selectedListIndex,
      ];

  @override
  String toString() {
    return 'TempListMode{isFirstSelected: $isFirstSelected, isSecondSelected : $isSecondSelected , labelTxt: $labelTxt}';
  }
}
