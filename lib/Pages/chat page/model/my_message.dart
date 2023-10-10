class MyChat {
  int? id;
  String? name;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  int? unreadMessagesCount;
  MMessage? lastMessage;
  List<MMessage>? messages;

  List<Participants>? participants;

  MyChat(
      {this.id,
      this.name,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.unreadMessagesCount,
      this.lastMessage,
      this.participants});

  MyChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unreadMessagesCount = json['unread_messages_count'];
    if (json['messages'] != null) {
      messages = <MMessage>[];
      json['messages'].forEach((v) {
        messages!.add(MMessage.fromJson(v));
      });
    }
    lastMessage = json['last_message'] != null
        ? MMessage.fromJson(json['last_message'])
        : null;
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unread_messages_count'] = this.unreadMessagesCount;
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MMessage {
  int? id;
  String? message;
  int? read;
  int? chatId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  MMessage(
      {this.id,
      this.message,
      this.read,
      this.chatId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  MMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    read = json['read'];
    chatId = json['chat_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['read'] = this.read;
    data['chat_id'] = this.chatId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  int? status;
  String? userType;

  User({this.id, this.fullName, this.email, this.status, this.userType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    status = json['status'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['status'] = this.status;
    data['user_type'] = this.userType;
    return data;
  }
}

class Participants {
  int? id;
  int? chatId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Participants(
      {this.id,
      this.chatId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['chat_id'] = this.chatId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
