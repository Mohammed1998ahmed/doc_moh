class PusherSendMessage {
  int? userId;
  int? trainerId;
  String? content;
  int? user;
  int? trainer;
  String? role;
  String? image;

  PusherSendMessage(
      {this.userId,
      this.trainerId,
      this.content,
      this.user,
      this.trainer,
      this.role,
      this.image});

  PusherSendMessage.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    trainerId = json['doctor_id'];
    content = json['content'];
    user = json['user'];
    trainer = json['doctor'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['doctor_id'] = this.trainerId;
    data['content'] = this.content;
    data['user'] = this.user;
    data['doctor'] = this.trainer;
    data['role'] = this.role;
    data['image'] = this.image;
    return data;
  }
}
