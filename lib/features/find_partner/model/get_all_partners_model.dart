class GetAllPartnerDetailsModel {
  int? status;
  String? message;
  List<Data>? data;

  GetAllPartnerDetailsModel({this.status, this.message, this.data});

  GetAllPartnerDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? userId;
  String? gotra;
  String? gender;
  String? dob;
  String? birthTime;
  String? manglik;
  String? heightF;
  String? heightI;
  String? maritalStatus;
  String? profileBy;
  String? fileToUpload;
  String? education;
  String? educationDetails;
  String? occupation;
  String? occupationDetails;
  String? hobbies;
  String? fatherName;
  String? fatherOccupation;
  String? motherName;
  String? state;
  String? location;
  String? city;

  Data(
      {this.id,
      this.name,
      this.userId,
      this.gotra,
      this.gender,
      this.dob,
      this.birthTime,
      this.manglik,
      this.heightF,
      this.heightI,
      this.maritalStatus,
      this.profileBy,
      this.fileToUpload,
      this.education,
      this.educationDetails,
      this.occupation,
      this.occupationDetails,
      this.hobbies,
      this.fatherName,
      this.fatherOccupation,
      this.motherName,
      this.state,
      this.location,
      this.city});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    gotra = json['gotra'];
    gender = json['gender'];
    dob = json['dob'];
    birthTime = json['birthTime'];
    manglik = json['manglik'];
    heightF = json['height_f'];
    heightI = json['height_i'];
    maritalStatus = json['marital_status'];
    profileBy = json['profileBy'];
    fileToUpload = json['fileToUpload'];
    education = json['education'];
    educationDetails = json['education_details'];
    occupation = json['occupation'];
    occupationDetails = json['occupation_details'];
    hobbies = json['hobbies'];
    fatherName = json['fatherName'];
    fatherOccupation = json['father_Occupation'];
    motherName = json['MotherName'];
    state = json['state'];
    location = json['location'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['gotra'] = this.gotra;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['birthTime'] = this.birthTime;
    data['manglik'] = this.manglik;
    data['height_f'] = this.heightF;
    data['height_i'] = this.heightI;
    data['marital_status'] = this.maritalStatus;
    data['profileBy'] = this.profileBy;
    data['fileToUpload'] = this.fileToUpload;
    data['education'] = this.education;
    data['education_details'] = this.educationDetails;
    data['occupation'] = this.occupation;
    data['occupation_details'] = this.occupationDetails;
    data['hobbies'] = this.hobbies;
    data['fatherName'] = this.fatherName;
    data['father_Occupation'] = this.fatherOccupation;
    data['MotherName'] = this.motherName;
    data['state'] = this.state;
    data['location'] = this.location;
    data['city'] = this.city;
    return data;
  }
}
