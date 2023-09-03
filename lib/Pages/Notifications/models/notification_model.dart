class NotificationModel {
  int? id;
  String? creatorName;
  int? typeId;
  String? text;
  String? api;
  int? userId;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
      this.creatorName,
      this.typeId,
      this.text,
      this.api,
      this.userId,
      this.createdAt,
      this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorName = json['creator_name'];
    typeId = json['type_id'];
    text = json['text'];
    api = json['api'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator_name'] = this.creatorName;
    data['type_id'] = this.typeId;
    data['text'] = this.text;
    data['api'] = this.api;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
