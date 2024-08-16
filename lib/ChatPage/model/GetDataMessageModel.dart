class ChatModelGetData {
  bool? success;
  String? message;
  List<Chats>? chats;

  ChatModelGetData({this.success, this.message, this.chats});

  ChatModelGetData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.chats != null) {
      data['chats'] = this.chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? id;
  int? userId;
  int? doctorId;
  int? user;
  int? doctor;
  String? time;
  String? content;
  String? role;
  String? image;
  int? read;
  String? createdAt;
  String? updatedAt;

  Chats(
      {this.id,
      this.userId,
      this.doctorId,
      this.user,
      this.doctor,
      this.time,
      this.content,
      this.role,
      this.image,
      this.read,
      this.createdAt,
      this.updatedAt});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    user = json['user'];
    doctor = json['doctor'];
    time = json['time'];
    content = json['content'];
    role = json['role'];
    image = json['image'];
    read = json['read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['user'] = this.user;
    data['doctor'] = this.doctor;
    data['time'] = this.time;
    data['content'] = this.content;
    data['role'] = this.role;
    data['image'] = this.image;
    data['read'] = this.read;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
