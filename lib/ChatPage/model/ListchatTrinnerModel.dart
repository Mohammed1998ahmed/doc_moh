class ListChatsTrinnerModel {
  List<ChatList>? chatList;
  bool? status;

  ListChatsTrinnerModel({this.chatList, this.status});

  ListChatsTrinnerModel.fromJson(Map<String, dynamic> json) {
    if (json['chatList'] != null) {
      chatList = <ChatList>[];
      json['chatList'].forEach((v) {
        chatList!.add(new ChatList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatList != null) {
      data['chatList'] = this.chatList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ChatList {
  int? userId;
  String? userName;
  String? lastMessage;
  String? lastMessageTime;
  String? image;
  String? sort;
  int? unreadMessages;
  List<int>? ids;

  ChatList(
      {this.userId,
      this.userName,
      this.lastMessage,
      this.lastMessageTime,
      this.image,
      this.sort,
      this.unreadMessages,
      this.ids});

  ChatList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
    image = json['image'];
    sort = json['sort'];
    unreadMessages = json['unread_messages'];
    ids = json['ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['last_message'] = this.lastMessage;
    data['last_message_time'] = this.lastMessageTime;
    data['image'] = this.image;
    data['sort'] = this.sort;
    data['unread_messages'] = this.unreadMessages;
    data['ids'] = this.ids;
    return data;
  }
}
