class OtherProfileModel {
  int? status;
  String? message;
  Data? data;

  OtherProfileModel({this.status, this.message, this.data});

  OtherProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != String ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != String) {
      data['data'] = this.data!.toJson();
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
  String? height;
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
  String? motherOccupation;
  String? bMarried;
  String? bUnmarried;
  String? sMarried;
  String? sUnmarried;
  String? address;
  String? state;
  String? location;
  String? city;
  String? pass1;
  String? idConform;
  String? dateTime;
  String? aboutUs;
  String? payment;
  String? txnId;
  String? paymentDate;
  int? age;
  String? dateOfBirth;
  String? profileImage;
  String? imageThumbImagePath;
  String? mobile;
  String? mobile2;
  String? email;

  Data(
      {this.id,
      this.name,
      this.userId,
      this.gotra,
      this.gender,
      this.dob,
      this.birthTime,
      this.manglik,
      this.height,
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
      this.motherOccupation,
      this.bMarried,
      this.bUnmarried,
      this.sMarried,
      this.sUnmarried,
      this.address,
      this.state,
      this.location,
      this.city,
      this.pass1,
      this.idConform,
      this.dateTime,
      this.aboutUs,
      this.payment,
      this.txnId,
      this.paymentDate,
      this.age,
      this.dateOfBirth,
      this.profileImage,
      this.imageThumbImagePath,
      this.mobile,
      this.mobile2,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    gotra = json['gotra'];
    gender = json['gender'];
    dob = json['dob'];
    birthTime = json['birthTime'];
    manglik = json['manglik'];
    height = json['height'];
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
    motherOccupation = json['mother_Occupation'];
    bMarried = json['b_married'];
    bUnmarried = json['b_unmarried'];
    sMarried = json['s_married'];
    sUnmarried = json['s_unmarried'];
    address = json['address'];
    state = json['state'];
    location = json['location'];
    city = json['city'];
    pass1 = json['pass1'];
    idConform = json['id_conform'];
    dateTime = json['date_time'];
    aboutUs = json['about_us'];
    payment = json['payment'];
    txnId = json['txn_id'];
    paymentDate = json['payment_date'];
    age = json['age'];
    dateOfBirth = json['dateOfBirth'];
    profileImage = json['profile_image'];
    imageThumbImagePath = json['image_thumbImagePath'];
    mobile = json['mobile'];
    mobile2 = json['mobile_2'];
    email = json['email'];
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
    data['height'] = this.height;
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
    data['mother_Occupation'] = this.motherOccupation;
    data['b_married'] = this.bMarried;
    data['b_unmarried'] = this.bUnmarried;
    data['s_married'] = this.sMarried;
    data['s_unmarried'] = this.sUnmarried;
    data['address'] = this.address;
    data['state'] = this.state;
    data['location'] = this.location;
    data['city'] = this.city;
    data['pass1'] = this.pass1;
    data['id_conform'] = this.idConform;
    data['date_time'] = this.dateTime;
    data['about_us'] = this.aboutUs;
    data['payment'] = this.payment;
    data['txn_id'] = this.txnId;
    data['payment_date'] = this.paymentDate;
    data['age'] = this.age;
    data['dateOfBirth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    data['image_thumbImagePath'] = this.imageThumbImagePath;
    data['mobile'] = this.mobile;
    data['mobile_2'] = this.mobile2;
    data['email'] = this.email;
    return data;
  }
}
