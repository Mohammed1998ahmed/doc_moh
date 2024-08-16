class DetailsConsutaltionModel {
  List<Consultation>? consultation;
  bool? status;

  DetailsConsutaltionModel({this.consultation, this.status});

  DetailsConsutaltionModel.fromJson(Map<String, dynamic> json) {
    if (json['Consultation'] != null) {
      consultation = <Consultation>[];
      json['Consultation'].forEach((v) {
        consultation!.add(new Consultation.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consultation != null) {
      data['Consultation'] = this.consultation!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Consultation {
  int? id;
  int? profileId;
  int? doctorId;
  int? healthCareId;
  String? content;
  String? sentAt;
  String? replyContent;
  String? replySentAt;
  String? name;
  String? color;
  String? symptoms;
  String? age;
  String? gender;
  Details? details;
  List<String>? images;
  Profile? profile;
  HealthCare? healthCare;

  Consultation(
      {this.id,
      this.profileId,
      this.doctorId,
      this.healthCareId,
      this.content,
      this.sentAt,
      this.replyContent,
      this.replySentAt,
      this.name,
      this.color,
      this.symptoms,
      this.age,
      this.gender,
      this.details,
      this.images,
      this.profile,
      this.healthCare});

  Consultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileId = json['profile_id'];
    doctorId = json['doctor_id'];
    healthCareId = json['health_care_id'];
    content = json['content'];
    sentAt = json['sent_at'];
    replyContent = json['reply_content'];
    replySentAt = json['reply_sent_at'];
    name = json['name'];
    color = json['color'];
    symptoms = json['symptoms'];
    age = json['age'];
    gender = json['gender'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    images = json['images'].cast<String>();
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    healthCare = json['health_care'] != null
        ? new HealthCare.fromJson(json['health_care'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile_id'] = this.profileId;
    data['doctor_id'] = this.doctorId;
    data['health_care_id'] = this.healthCareId;
    data['content'] = this.content;
    data['sent_at'] = this.sentAt;
    data['reply_content'] = this.replyContent;
    data['reply_sent_at'] = this.replySentAt;
    data['name'] = this.name;
    data['color'] = this.color;
    data['symptoms'] = this.symptoms;
    data['age'] = this.age;
    data['gender'] = this.gender;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['images'] = this.images;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.healthCare != null) {
      data['health_care'] = this.healthCare!.toJson();
    }
    return data;
  }
}

class Details {
  List<Vaccination>? vaccination;
  List<Treatment>? treatment;
  List<Medical>? medical;

  Details({this.vaccination, this.treatment, this.medical});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['vaccination'] != null) {
      vaccination = <Vaccination>[];
      json['vaccination'].forEach((v) {
        vaccination!.add(new Vaccination.fromJson(v));
      });
    }
    if (json['treatment'] != null) {
      treatment = <Treatment>[];
      json['treatment'].forEach((v) {
        treatment!.add(new Treatment.fromJson(v));
      });
    }
    if (json['medical'] != null) {
      medical = <Medical>[];
      json['medical'].forEach((v) {
        medical!.add(new Medical.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vaccination != null) {
      data['vaccination'] = this.vaccination!.map((v) => v.toJson()).toList();
    }
    if (this.treatment != null) {
      data['treatment'] = this.treatment!.map((v) => v.toJson()).toList();
    }
    if (this.medical != null) {
      data['medical'] = this.medical!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaccination {
  int? id;
  String? details;
  String? date;

  Vaccination({this.id, this.details, this.date});

  Vaccination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['date'] = this.date;
    return data;
  }
}

class Treatment {
  int? id;
  String? details;
  String? date;

  Treatment({this.id, this.details, this.date});

  Treatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['date'] = this.date;
    return data;
  }
}

class Medical {
  int? id;
  String? details;
  String? date;

  Medical({this.id, this.details, this.date});

  Medical.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['date'] = this.date;
    return data;
  }
}

class Profile {
  int? id;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? profile;
  String? email;

  Profile(
      {this.id,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.profile,
      this.email});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    profile = json['profile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['profile'] = this.profile;
    data['email'] = this.email;
    return data;
  }
}

class HealthCare {
  int? id;
  String? name;
  String? address;
  String? description;
  String? profileImage;
  String? license;
  String? website;
  String? lat;
  String? long;
  String? start;
  String? end;
  int? userId;

  HealthCare(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.profileImage,
      this.license,
      this.website,
      this.lat,
      this.long,
      this.start,
      this.end,
      this.userId});

  HealthCare.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    profileImage = json['profile_image'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
    start = json['start'];
    end = json['end'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['profile_image'] = this.profileImage;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['start'] = this.start;
    data['end'] = this.end;
    data['user_id'] = this.userId;
    return data;
  }
}
