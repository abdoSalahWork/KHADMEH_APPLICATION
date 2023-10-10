import 'package:khedma/Pages/HomePage/models/advertisment_model.dart';

class UserHomePageModel {
  List<UserStatsCompanyHomePageModel>? companiesRecruitment;
  List<UserStatsCompanyHomePageModel>? companiesCleaning;
  List<Employees>? employees;
  List<AdvertismentModel>? ads;
  String? logoUrlCompany;
  String? imageUrlEmployee;
  String? imageUrlAds;

  UserHomePageModel(
      {this.companiesRecruitment,
      this.companiesCleaning,
      this.employees,
      this.ads,
      this.logoUrlCompany,
      this.imageUrlEmployee,
      this.imageUrlAds});

  UserHomePageModel.fromJson(Map<String, dynamic> json) {
    if (json['companiesRecruitment'] != null) {
      companiesRecruitment = <UserStatsCompanyHomePageModel>[];
      json['companiesRecruitment'].forEach((v) {
        companiesRecruitment!.add(UserStatsCompanyHomePageModel.fromJson(v));
      });
    }
    if (json['companiesCleaning'] != null) {
      companiesCleaning = <UserStatsCompanyHomePageModel>[];
      json['companiesCleaning'].forEach((v) {
        companiesCleaning!.add(UserStatsCompanyHomePageModel.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <AdvertismentModel>[];
      json['ads'].forEach((v) {
        ads!.add(AdvertismentModel.fromJson(v));
      });
    }
    logoUrlCompany = json['logoUrlCompany'];
    imageUrlEmployee = json['imageUrlEmployee'];
    imageUrlAds = json['imageUrlAds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.companiesRecruitment != null) {
      data['companiesRecruitment'] =
          this.companiesRecruitment!.map((v) => v.toJson()).toList();
    }
    if (this.companiesCleaning != null) {
      data['companiesCleaning'] =
          this.companiesCleaning!.map((v) => v.toJson()).toList();
    }
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    data['ads'] = this.ads;
    data['logoUrlCompany'] = this.logoUrlCompany;
    data['imageUrlEmployee'] = this.imageUrlEmployee;
    data['imageUrlAds'] = this.imageUrlAds;
    return data;
  }
}

class UserStatsCompanyHomePageModel {
  int? id;
  String? fullName;
  String? email;
  int? status;
  String? userType;
  int? reviewCompanyCount;
  String? reviewCompanySumReviewValue;
  CompanyInformation? companyInformation;

  UserStatsCompanyHomePageModel(
      {this.id,
      this.fullName,
      this.email,
      this.status,
      this.userType,
      this.reviewCompanyCount,
      this.reviewCompanySumReviewValue,
      this.companyInformation});

  UserStatsCompanyHomePageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    status = json['status'];
    userType = json['user_type'];
    reviewCompanyCount = json['review_company_count'];
    reviewCompanySumReviewValue = json['review_company_sum_review_value'];
    companyInformation = json['company_information'] != null
        ? CompanyInformation.fromJson(json['company_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['status'] = this.status;
    data['user_type'] = this.userType;
    data['review_company_count'] = this.reviewCompanyCount;
    data['review_company_sum_review_value'] = this.reviewCompanySumReviewValue;
    if (this.companyInformation != null) {
      data['company_information'] = this.companyInformation!.toJson();
    }
    return data;
  }
}

class CompanyInformation {
  int? id;
  int? companyId;
  String? companyLogo;

  CompanyInformation({this.id, this.companyId, this.companyLogo});

  CompanyInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    companyLogo = json['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['company_logo'] = this.companyLogo;
    return data;
  }
}

class Employees {
  int? id;
  String? name;
  int? nationalityId;
  String? image;
  Nationality? nationality;

  Employees(
      {this.id, this.name, this.nationalityId, this.image, this.nationality});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nationalityId = json['nationality_id'];
    image = json['image'];
    nationality = json['nationality'] != null
        ? Nationality.fromJson(json['nationality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nationality_id'] = this.nationalityId;
    data['image'] = this.image;
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    return data;
  }
}

class Nationality {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nationalityEn;
  String? nationalityAr;
  String? flag;
  String? code;
  String? currency;
  String? shortCurrency;
  String? shortName;

  Nationality(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.nationalityEn,
      this.nationalityAr,
      this.flag,
      this.code,
      this.currency,
      this.shortCurrency,
      this.shortName});

  Nationality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nationalityEn = json['nationality_en'];
    nationalityAr = json['nationality_ar'];
    flag = json['flag'];
    code = json['code'];
    currency = json['currency'];
    shortCurrency = json['short_currency'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['nationality_en'] = this.nationalityEn;
    data['nationality_ar'] = this.nationalityAr;
    data['flag'] = this.flag;
    data['code'] = this.code;
    data['currency'] = this.currency;
    data['short_currency'] = this.shortCurrency;
    data['short_name'] = this.shortName;
    return data;
  }
}
