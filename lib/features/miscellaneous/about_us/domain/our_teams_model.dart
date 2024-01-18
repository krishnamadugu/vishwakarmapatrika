class OurTeamsModel {
  int? status;
  String? message;
  List<Data>? data;

  OurTeamsModel({this.status, this.message, this.data});

  OurTeamsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? subtitle;
  String? fb;
  String? youtube;
  String? insta;
  String? description;
  String? imageUrl;

  Data(
      {this.id,
      this.title,
      this.subtitle,
      this.fb,
      this.youtube,
      this.insta,
      this.description,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    fb = json['fb'];
    youtube = json['youtube'];
    insta = json['insta'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['fb'] = this.fb;
    data['youtube'] = this.youtube;
    data['insta'] = this.insta;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
