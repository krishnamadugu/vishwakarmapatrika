class FormFieldListDataModel {
  int? status;
  String? message;
  Data? data;

  FormFieldListDataModel({this.status, this.message, this.data});

  FormFieldListDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? subcaste;
  List<String>? profileBy;
  List<String>? state;
  List<String>? educationsLists;
  List<String>? maritalStatus;

  Data(
      {this.subcaste,
      this.profileBy,
      this.state,
      this.educationsLists,
      this.maritalStatus});

  Data.fromJson(Map<String, dynamic> json) {
    subcaste = json['subcaste'].cast<String>();
    profileBy = json['profileBy'].cast<String>();
    state = json['state'].cast<String>();
    educationsLists = json['educationsLists'].cast<String>();
    maritalStatus = json['maritalStatus'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcaste'] = this.subcaste;
    data['profileBy'] = this.profileBy;
    data['state'] = this.state;
    data['educationsLists'] = this.educationsLists;
    data['maritalStatus'] = this.maritalStatus;
    return data;
  }
}
