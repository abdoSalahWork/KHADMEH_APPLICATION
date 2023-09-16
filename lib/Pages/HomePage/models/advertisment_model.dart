class AdvertismentModel {
  int? id;
  var image;
  int? durationByDay = 0;
  int? promotionType;
  String? externalLink;
  int? confirm;
  int? adminApprove;
  String? startDate;
  String? endDate;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  AdvertismentModel({
    this.id,
    this.image,
    this.durationByDay = 0,
    this.promotionType,
    this.externalLink,
    this.confirm,
    this.adminApprove,
    this.startDate,
    this.endDate,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  AdvertismentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image =
        "https://wazzfny.online/api/files/images/addvertisment/${json['image']}";
    durationByDay = json['duration_by_day'];
    promotionType = json['promotion_type'];
    externalLink = json['external_link'];
    confirm = json['confirm'];
    adminApprove = json['admin_approve'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    // data['image'] = this.image;
    data['duration_by_day'] = durationByDay;
    data['promotion_type'] = promotionType;
    data['external_link'] = externalLink;
    data['start_date'] = startDate;

    return data;
  }
}
