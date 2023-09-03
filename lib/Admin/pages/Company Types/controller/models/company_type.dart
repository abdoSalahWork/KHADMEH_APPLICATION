class CompanyType {
  int? id;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  CompanyType(
      {this.id, this.nameEn, this.nameAr, this.createdAt, this.updatedAt});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
