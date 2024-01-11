import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../model/temp_choose_partner_model.dart';

class FindPartnerCubit extends Cubit<TempChoosePartnerModel> {
  FindPartnerCubit()
      : super(TempChoosePartnerModel(selectedPartner: AppStrings.txtGroom));

  void onPartnerSelected(String val) {
    emit(state.copyWith(selectedPartner: val));
    debugPrint(state.toString());
  }
}
