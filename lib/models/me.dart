// ignore_for_file: unnecessary_this

class Me {
  int? id;
  String? fullName;
  String? email;
  String? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? userType;
  UserInformation? userInformation;
  CompanyInformation? companyInformation;

  Me({
    this.id,
    this.fullName,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userType,
    this.userInformation,
    this.companyInformation,
  });

  Me.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userType = json['user_type'];
    userInformation = json['user_information'] != null
        ? UserInformation.fromJson(json['user_information'])
        : null;
    companyInformation = json['company_information'] != null
        ? CompanyInformation.fromJson(json['company_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_type'] = this.userType;
    if (this.userInformation != null) {
      data['user_information'] = this.userInformation!.toJson();
    }
    if (this.companyInformation != null) {
      data['company_information'] = this.companyInformation!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class CompanyInformation {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? idNumber;
  String? dateOfBirth;
  String? companyPhone;
  String? companyPhoneVerifiedAt;
  String? url;
  String? companyType;
  String? pieceNumber;
  String? street;
  String? building;
  String? automatedAddressNumber;
  String? commercialRegistrationNumber;
  String? taxNumber;
  String? licenseNumber;
  String? companyLogo;
  String? identityConfirmation;
  String? frontSideIdImage;
  String? backSideIdImage;
  String? passportImage;
  int? nationalityId;
  int? companyId;
  int? cityId;
  int? regionId;
  String? createdAt;
  String? updatedAt;
  String? companyName;

  CompanyInformation(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.idNumber,
      this.dateOfBirth,
      this.companyPhone,
      this.companyPhoneVerifiedAt,
      this.url,
      this.companyType,
      this.pieceNumber,
      this.street,
      this.building,
      this.automatedAddressNumber,
      this.commercialRegistrationNumber,
      this.taxNumber,
      this.licenseNumber,
      this.companyLogo,
      this.identityConfirmation,
      this.frontSideIdImage,
      this.backSideIdImage,
      this.passportImage,
      this.nationalityId,
      this.companyId,
      this.cityId,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.companyName});

  CompanyInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    idNumber = json['id_number'];
    dateOfBirth = json['date_of_birth'];
    companyPhone = json['company_phone'];
    companyPhoneVerifiedAt = json['company_phone_verified_at'];
    url = json['url'];
    companyType = json['company_type'];
    pieceNumber = json['piece_number'];
    street = json['street'];
    building = json['building'];
    automatedAddressNumber = json['automated_address_number'];
    commercialRegistrationNumber = json['commercial_registration_number'];
    taxNumber = json['tax_number'];
    licenseNumber = json['license_number'];
    companyLogo = json['company_logo'];
    identityConfirmation = json['identity_confirmation'];
    frontSideIdImage = json['front_side_id_image'];
    backSideIdImage = json['back_side_id_image'];
    passportImage = json['passport_image'];
    nationalityId = json['nationality_id'];
    companyId = json['company_id'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['company_phone'] = this.companyPhone;
    data['company_phone_verified_at'] = this.companyPhoneVerifiedAt;
    data['url'] = this.url;
    data['company_type'] = this.companyType;
    data['piece_number'] = this.pieceNumber;
    data['street'] = this.street;
    data['building'] = this.building;
    data['automated_address_number'] = this.automatedAddressNumber;
    data['commercial_registration_number'] = this.commercialRegistrationNumber;
    data['tax_number'] = this.taxNumber;
    data['license_number'] = this.licenseNumber;
    data['company_logo'] = this.companyLogo;
    data['identity_confirmation'] = this.identityConfirmation;
    data['front_side_id_image'] = this.frontSideIdImage;
    data['back_side_id_image'] = this.backSideIdImage;
    data['passport_image'] = this.passportImage;
    data['nationality_id'] = this.nationalityId;
    data['company_id'] = this.companyId;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_name'] = this.companyName;
    return data;
  }
}
