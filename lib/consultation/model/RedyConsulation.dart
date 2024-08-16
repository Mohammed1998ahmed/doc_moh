class RedyConsulationModel {
  String? message;
  Consultation? consultation;
  bool? status;

  RedyConsulationModel({this.message, this.consultation, this.status});

  RedyConsulationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    consultation = json['Consultation'] != null
        ? new Consultation.fromJson(json['Consultation'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.consultation != null) {
      data['Consultation'] = this.consultation!.toJson();
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
      this.images});

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
