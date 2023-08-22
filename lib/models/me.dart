class Me {
  int? id;
  String? fullName;
  String? email;
  String? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  UserInformation? userInformation;

  Me(
      {this.id,
      this.fullName,
      this.email,
      this.emailVerifiedAt,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.userInformation});

  Me.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userInformation = json['user_information'] != null
        ? new UserInformation.fromJson(json['user_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userInformation != null) {
      data['user_information'] = this.userInformation!.toJson();
    }
    return data;
  }
}

class UserInformation {
  int? id;
  String? phone;
  String? userType;
  String? jobName;
  int? nationalityId;
  int? userId;
  int? cityId;
  int? regionId;
  String? pieceNumber;
  String? street;
  String? building;
  String? automatedAddressNumber;
  String? idNumberNationality;
  String? idPhotoNationality;
  String? personalPhoto;
  String? referenceNumber;
  String? phoneVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? userName;

  UserInformation(
      {this.id,
      this.phone,
      this.userType,
      this.jobName,
      this.nationalityId,
      this.userId,
      this.cityId,
      this.regionId,
      this.pieceNumber,
      this.street,
      this.building,
      this.automatedAddressNumber,
      this.idNumberNationality,
      this.idPhotoNationality,
      this.personalPhoto,
      this.referenceNumber,
      this.phoneVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.userName});

  UserInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    userType = json['user_type'];
    jobName = json['job_name'];
    nationalityId = json['nationality_id'];
    userId = json['user_id'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    pieceNumber = json['piece_number'];
    street = json['street'];
    building = json['building'];
    automatedAddressNumber = json['automated_address_number'];
    idNumberNationality = json['id_number_nationality'];
    idPhotoNationality = json['id_photo_nationality'];
    personalPhoto = json['personal_photo'];
    referenceNumber = json['reference_number'];
    phoneVerifiedAt = json['phone_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['user_type'] = this.userType;
    data['job_name'] = this.jobName;
    data['nationality_id'] = this.nationalityId;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['piece_number'] = this.pieceNumber;
    data['street'] = this.street;
    data['building'] = this.building;
    data['automated_address_number'] = this.automatedAddressNumber;
    data['id_number_nationality'] = this.idNumberNationality;
    data['id_photo_nationality'] = this.idPhotoNationality;
    data['personal_photo'] = this.personalPhoto;
    data['reference_number'] = this.referenceNumber;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_name'] = this.userName;
    return data;
  }
}
