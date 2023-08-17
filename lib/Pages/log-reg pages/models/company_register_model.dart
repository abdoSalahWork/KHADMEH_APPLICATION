class CompanyRegisterData {
  String? userType;
  String? firstName;
  String? lastName;
  String? phone;
  String? nationalityId;
  String? idNumber;
  String? dateOfBirth;
  String? companyName;
  String? companyPhone;
  String? companyEmail;
  String? url;
  String? companyType;
  String? cityId;
  String? regionId;
  String? pieceNumber;
  String? street;
  String? building;
  String? automatedAddressNumber;
  String? commercialRegistrationNumber;
  String? taxNumber;
  String? licenseNumber;
  String? identityConfirmation;
  String? password;
  String? passwordConfirmation;
  var companyLogo;
  var passportImage;
  var frontSideIdImage;
  var backSideIdImage;

  CompanyRegisterData(
      {this.userType,
      this.firstName,
      this.lastName,
      this.phone,
      this.nationalityId,
      this.idNumber,
      this.dateOfBirth,
      this.companyName,
      this.companyPhone,
      this.companyEmail,
      this.url,
      this.companyType = "recruitment",
      this.cityId,
      this.regionId,
      this.pieceNumber,
      this.street,
      this.building,
      this.automatedAddressNumber,
      this.commercialRegistrationNumber,
      this.taxNumber,
      this.licenseNumber,
      this.identityConfirmation = "id",
      this.password,
      this.passwordConfirmation,
      this.companyLogo,
      this.passportImage,
      this.frontSideIdImage,
      this.backSideIdImage});

  CompanyRegisterData.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    nationalityId = json['nationality_id'];
    idNumber = json['id_number'];
    dateOfBirth = json['date_of_birth'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    companyEmail = json['company_email'];
    url = json['url'];
    companyType = json['company_type'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    pieceNumber = json['piece_number'];
    street = json['street'];
    building = json['building'];
    automatedAddressNumber = json['automated_address_number'];
    commercialRegistrationNumber = json['commercial_registration_number'];
    taxNumber = json['tax_number'];
    licenseNumber = json['license_number'];
    identityConfirmation = json['identity_confirmation'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    companyLogo = json['company_logo'];
    passportImage = json['passport_image'];
    frontSideIdImage = json['front_side_id_image'];
    backSideIdImage = json['back_side_id_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['nationality_id'] = this.nationalityId;
    data['id_number'] = this.idNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['company_name'] = this.companyName;
    data['company_phone'] = this.companyPhone;
    data['company_email'] = this.companyEmail;
    data['url'] = this.url;
    data['company_type'] = this.companyType;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['piece_number'] = this.pieceNumber;
    data['street'] = this.street;
    data['building'] = this.building;
    data['automated_address_number'] = this.automatedAddressNumber;
    data['commercial_registration_number'] = this.commercialRegistrationNumber;
    data['tax_number'] = this.taxNumber;
    data['license_number'] = this.licenseNumber;
    data['identity_confirmation'] = this.identityConfirmation;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;

    return data;
  }
}
