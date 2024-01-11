import 'package:equatable/equatable.dart';

//ignore : must_ignore_immutable
class TempListMode extends Equatable {
  late bool isFirstSelected;
  late bool isSecondSelected;
  final String labelTxt;

  TempListMode({
    this.labelTxt = '',
    this.isSecondSelected = false,
    this.isFirstSelected = false,
  });

  TempListMode copyWith({
    bool? isFirstSelected,
    bool? isSecondSelected,
    String? labelTxt,
  }) {
    return TempListMode(
      labelTxt: labelTxt ?? this.labelTxt,
      isFirstSelected: isFirstSelected ?? this.isFirstSelected,
      isSecondSelected: isSecondSelected ?? this.isSecondSelected,
    );
  }

  @override
  List<Object?> get props => [
        isFirstSelected,
        isSecondSelected,
        labelTxt,
      ];

  @override
  String toString() {
    return 'TempListMode{isFirstSelected: $isFirstSelected, isSecondSelected : $isSecondSelected , labelTxt: $labelTxt}';
  }
}

class HomeClassOverall extends Equatable {
  List<TempListMode>? items;
  HomeClassOverall({
    this.items,
  });
  HomeClassOverall copyWith({
    List<TempListMode>? items,
  }) {
    return HomeClassOverall(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
