import 'package:equatable/equatable.dart';

//ignore : must_ignore_immutable
class TempListMode extends Equatable {
  late bool isSelected;
  final String labelTxt;

  TempListMode({
    this.labelTxt = '',
    this.isSelected = false,
  });

  TempListMode copyWith({
    bool? isSelected,
    String? labelTxt,
  }) {
    return TempListMode(
      labelTxt: labelTxt ?? this.labelTxt,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [
        isSelected,
        labelTxt,
      ];

  @override
  String toString() {
    return 'TempListMode{isSelected: $isSelected, labelTxt: $labelTxt}';
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
