import 'package:khedma/Pages/HomePage/company%20home/models/employee_model.dart';
import 'package:khedma/Pages/HomePage/models/company_model.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/city.dart';

class Me {
  int? id;
  String? fullName;
  String? email;
  String? emailVerifiedAt;
  int? status;
  int? block;
  String? createdAt;
  String? updatedAt;
  String? userType;
  UserInformation? userInformation;
  CompanyInformation? companyInformation;
  List<Favourite>? favouriteCompany;
  List<Favourite>? favouriteEmployee;
  Me({
    this.id,
    this.fullName,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.block,
    this.createdAt,
    this.updatedAt,
    this.userType,
    this.userInformation,
    this.companyInformation,
    this.favouriteCompany,
    this.favouriteEmployee,
  });

  Me.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    block = json['block'];
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
    if (json['favourite_company'] != null) {
      favouriteCompany = <Favourite>[];
      json['favourite_company'].forEach((v) {
        favouriteCompany!.add(Favourite.fromJson(v));
      });
    }
    if (json['favourite_employee'] != null) {
      favouriteEmployee = <Favourite>[];
      json['favourite_employee'].forEach((v) {
        favouriteEmployee!.add(Favourite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (data['id'] != null) data['id'] = id;
    if (data['block'] != null) data['block'] = block;
    if (data['full_name'] != null) data['full_name'] = fullName;
    if (data['email'] != null) data['email'] = email;
    if (data['email_verified_at'] != null) {
      data['email_verified_at'] = emailVerifiedAt;
    }
    if (data['status'] != null) data['status'] = status;
    if (data['created_at'] != null) data['created_at'] = createdAt;
    if (data['updated_at'] != null) data['updated_at'] = updatedAt;
    if (data['user_type'] != null) data['user_type'] = userType;
    if (userInformation != null) {
      data['user_information'] = userInformation!.toJson();
    }
    if (companyInformation != null) {
      data['company_information'] = companyInformation!.toJson();
    }
    if (favouriteCompany != null) {
      data['favourite_company'] =
          favouriteCompany!.map((v) => v.toJson()).toList();
    }
    if (favouriteEmployee != null) {
      data['favourite_employee'] =
          favouriteEmployee!.map((v) => v.toJson()).toList();
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
  List<Booking> booking = [];
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
    idPhotoNationality =
        "https://khdmah.online/api/images/user/${json['id_photo_nationality']}/";
    personalPhoto =
        "https://khdmah.online/api/images/user/${json['personal_photo']}/";
    referenceNumber = json['reference_number'];
    phoneVerifiedAt = json['phone_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
    if (json['booking_me'] != null) {
      booking = <Booking>[];
      json['booking_me'].forEach((v) {
        Booking x = Booking.fromJson(v);
        logSuccess(v);
        booking.add(x);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['phone'] = phone;
    data['user_type'] = userType;
    data['job_name'] = jobName;
    data['nationality_id'] = nationalityId;
    data['user_id'] = userId;
    data['city_id'] = cityId;
    data['region_id'] = regionId;
    data['piece_number'] = pieceNumber;
    data['street'] = street;
    data['building'] = building;
    data['automated_address_number'] = automatedAddressNumber;
    data['id_number_nationality'] = idNumberNationality;
    data['id_photo_nationality'] = idPhotoNationality;
    data['personal_photo'] = personalPhoto;
    data['reference_number'] = referenceNumber;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_name'] = userName;

    data['booking_me'] = booking.map((v) => v.toJson()).toList();

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
  var companyLogo;
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
  List<EmployeeModel>? employees;
  City? city;

  CompanyInformation(
      {this.id,
      this.firstName,
      this.city,
      this.employees,
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
    if (json['city'] != null) {
      city = City.fromJson(json['city']);
    }
    if (json['employee'] != null) {
      employees = <EmployeeModel>[];
      json['employee'].forEach((v) {
        employees!.add(EmployeeModel.fromJson(v));
      });
    }
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
    companyLogo =
        "https://khdmah.online/api/images/company/${json['company_logo']}/";

    identityConfirmation = json['identity_confirmation'];
    frontSideIdImage =
        "https://khdmah.online/api/images/company/${json['front_side_id_image']}/";
    backSideIdImage =
        "https://khdmah.online/api/images/company/${json['back_side_id_image']}/";
    passportImage =
        "https://khdmah.online/api/images/company/${json['passport_image']}/";
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
    if (city != null) data['city'] = city!.toJson();

    if (employees != null) {
      data['employee'] = employees!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['id_number'] = idNumber;
    data['date_of_birth'] = dateOfBirth;
    data['company_phone'] = companyPhone;
    data['company_phone_verified_at'] = companyPhoneVerifiedAt;
    data['url'] = url;
    data['company_type'] = companyType;
    data['piece_number'] = pieceNumber;
    data['street'] = street;
    data['building'] = building;
    data['automated_address_number'] = automatedAddressNumber;
    data['commercial_registration_number'] = commercialRegistrationNumber;
    data['tax_number'] = taxNumber;
    data['license_number'] = licenseNumber;
    // data['company_logo'] = this.companyLogo;
    data['identity_confirmation'] = identityConfirmation;
    data['front_side_id_image'] = frontSideIdImage;
    data['back_side_id_image'] = backSideIdImage;
    data['passport_image'] = passportImage;
    data['nationality_id'] = nationalityId;
    data['company_id'] = companyId;
    data['city_id'] = cityId;
    data['region_id'] = regionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['company_name'] = companyName;
    return data;
  }
}

class Favourite {
  int? id;
  int? type;
  int? typeId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  CompanyModel? company;
  EmployeeModel? employee;
  Favourite({
    this.id,
    this.type,
    this.typeId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.company,
    this.employee,
  });

  Favourite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    typeId = json['type_id'];
    userId = json['user_id'];
    if (json['company'] != null) {
      company = CompanyModel.fromJson(json['company']);
    }
    if (json['employee'] != null) {
      employee = EmployeeModel.fromJson(json['employee']);
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (type != null) data['type'] = type;
    if (typeId != null) data['type_id'] = typeId;
    if (userId != null) data['user_id'] = userId;
    if (createdAt != null) data['created_at'] = createdAt;
    if (updatedAt != null) data['updated_at'] = updatedAt;
    if (company != null) data["company"] = company!.toJson();
    if (employee != null) data["employee"] = employee!.toJson();
    return data;
  }
}

class Booking {
  int? id;
  String? status;
  int? employeeId;
  String? pendingInvoiceId;
  String? bookedInvoiceId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? pendingAmount;
  String? bookingAmount;
  EmployeeModel? employee;
  Booking(
      {this.id,
      this.status,
      this.employeeId,
      this.pendingInvoiceId,
      this.bookedInvoiceId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.pendingAmount,
      this.employee,
      this.bookingAmount});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    employeeId = json['employee_id'];
    pendingInvoiceId = json['pending_invoice_id'];
    bookedInvoiceId = json['booked_invoice_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pendingAmount = json['pending_amount'];
    bookingAmount = json['booking_amount'];
    employee = json['employee'] != null
        ? EmployeeModel.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (status != null) data['status'] = status;
    if (employeeId != null) data['employee_id'] = employeeId;
    if (pendingInvoiceId != null) data['pending_invoice_id'] = pendingInvoiceId;
    if (bookedInvoiceId != null) data['booked_invoice_id'] = bookedInvoiceId;
    if (userId != null) data['user_id'] = userId;
    if (createdAt != null) data['created_at'] = createdAt;
    if (updatedAt != null) data['updated_at'] = updatedAt;
    if (pendingAmount != null) data['pending_amount'] = pendingAmount;
    if (bookingAmount != null) data['booking_amount'] = bookingAmount;
    if (employee != null) data['employee'] = employee!.toJson();
    return data;
  }
}
