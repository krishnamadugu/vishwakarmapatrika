import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/data/data_source/form_field_list_data_provider.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/model/form_field_list_model.dart';

class FormFieldListRepository {
  final FormFieldListDataProvider formFieldListDataProvider;
  FormFieldListRepository({
    required this.formFieldListDataProvider,
  });

  Future<FormFieldListDataModel> getFormData() async {
    try {
      final formFieldListData =
          jsonDecode(await formFieldListDataProvider.getFormFieldData());
      if (formFieldListData['status'] != 1) {
        debugPrint('${formFieldListData['message']}');
        throw '${formFieldListData['message']}';
      }
      return FormFieldListDataModel.fromJson(formFieldListData);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
