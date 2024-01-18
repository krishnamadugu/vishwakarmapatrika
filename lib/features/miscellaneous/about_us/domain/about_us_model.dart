class AboutUsModel {
  int? status;
  String? message;
  List<Data>? data;

  AboutUsModel({this.status, this.message, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? aboutContent;
  String? fb;
  String? youtube;
  String? insta;
  String? android;
  String? mobileAppDescription;
  String? copyright;
  String? email;
  String? currentVersion;
  String? appBottomImage;

  Data(
      {this.id,
      this.aboutContent,
      this.fb,
      this.youtube,
      this.insta,
      this.android,
      this.mobileAppDescription,
      this.copyright,
      this.email,
      this.currentVersion,
      this.appBottomImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aboutContent = json['about_content'];
    fb = json['fb'];
    youtube = json['youtube'];
    insta = json['insta'];
    android = json['android'];
    mobileAppDescription = json['mobile_app_description'];
    copyright = json['copyright'];
    email = json['email'];
    currentVersion = json['current_version'];
    appBottomImage = json['app_bottom_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['about_content'] = this.aboutContent;
    data['fb'] = this.fb;
    data['youtube'] = this.youtube;
    data['insta'] = this.insta;
    data['android'] = this.android;
    data['mobile_app_description'] = this.mobileAppDescription;
    data['copyright'] = this.copyright;
    data['email'] = this.email;
    data['current_version'] = this.currentVersion;
    data['app_bottom_image'] = this.appBottomImage;
    return data;
  }
}
