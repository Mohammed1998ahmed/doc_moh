// class ProfileEdit {
//   bool? status;
//   String? message;
//   Data? data;

//   ProfileEdit({this.status, this.message, this.data});

//   ProfileEdit.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;

//   Data(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.points,
//       this.credit,
//       this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['image'] = this.image;
//     data['points'] = this.points;
//     data['credit'] = this.credit;
//     data['token'] = this.token;
//     return data;
//   }
// }
class UpdataModel {
  String? message;
  Doctor? doctor;
  bool? status;

  UpdataModel({this.message, this.doctor, this.status});

  UpdataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    doctor =
        json['Doctor'] != null ? new Doctor.fromJson(json['Doctor']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.doctor != null) {
      data['Doctor'] = this.doctor!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Doctor {
  int? id;
  String? firstName;
  String? lastName;
  String? birth;
  String? gender;
  String? image;
  String? description;
  int? experience;
  String? specialties;
  int? userId;
  int? healthCareId;
  User? user;

  Doctor(
      {this.id,
      this.firstName,
      this.lastName,
      this.birth,
      this.gender,
      this.image,
      this.description,
      this.experience,
      this.specialties,
      this.userId,
      this.healthCareId,
      this.user});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birth = json['birth'];
    gender = json['gender'];
    image = json['image'];
    description = json['description'];
    experience = json['experience'];
    specialties = json['specialties'];
    userId = json['user_id'];
    healthCareId = json['health_care_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['description'] = this.description;
    data['experience'] = this.experience;
    data['specialties'] = this.specialties;
    data['user_id'] = this.userId;
    data['health_care_id'] = this.healthCareId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? mobile;
  String? email;
  String? valid;
  String? type;
  String? verificationCode;
  String? resetToken;
  String? verificationCodeExpiresAt;
  String? resetTokenExpiresAt;
  String? emailVerifiedAt;

  User(
      {this.id,
      this.mobile,
      this.email,
      this.valid,
      this.type,
      this.verificationCode,
      this.resetToken,
      this.verificationCodeExpiresAt,
      this.resetTokenExpiresAt,
      this.emailVerifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    email = json['email'];
    valid = json['valid'];
    type = json['type'];
    verificationCode = json['verificationCode'];
    resetToken = json['resetToken'];
    verificationCodeExpiresAt = json['verification_code_expires_at'];
    resetTokenExpiresAt = json['reset_token_expires_at'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['valid'] = this.valid;
    data['type'] = this.type;
    data['verificationCode'] = this.verificationCode;
    data['resetToken'] = this.resetToken;
    data['verification_code_expires_at'] = this.verificationCodeExpiresAt;
    data['reset_token_expires_at'] = this.resetTokenExpiresAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}
