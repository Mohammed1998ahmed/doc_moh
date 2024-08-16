class ChatModelSent {
  MessageD? messageD;
  bool? success;
  String? message;

  ChatModelSent({this.messageD, this.success, this.message});

  ChatModelSent.fromJson(Map<String, dynamic> json) {
    messageD = json['0'] != null ? new MessageD.fromJson(json['0']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messageD != null) {
      data['0'] = this.messageD!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class MessageD {
  String? image;
  String? userId;
  String? doctorId;
  String? content;
  String? role;
  String? user;
  String? doctor;
  String? time;
  String? updatedAt;
  String? createdAt;
  int? id;

  MessageD(
      {this.image,
      this.userId,
      this.doctorId,
      this.content,
      this.role,
      this.user,
      this.doctor,
      this.time,
      this.updatedAt,
      this.createdAt,
      this.id});

  MessageD.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    content = json['content'];
    role = json['role'];
    user = json['user'];
    doctor = json['doctor'];
    time = json['time'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['content'] = this.content;
    data['role'] = this.role;
    data['user'] = this.user;
    data['doctor'] = this.doctor;
    data['time'] = this.time;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
