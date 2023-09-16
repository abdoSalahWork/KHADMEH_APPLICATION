import 'package:khedma/Admin/pages/jobs/models/job_model.dart';
import 'package:khedma/Admin/pages/languages/models/language_model.dart';

class EmployeeModel {
  int? id;
  String? name;
  String? dateOfBirth;
  String? timeWorkPerDay;
  String? hourSalary;
  int? numOfChildren;
  int? hight;
  int? weight;
  String? salaryMonth;
  String? numberYearContract;
  String? contractAmount;
  String? contractDuration;
  int? previousWorkAbroad;
  int? durationOfEmployment;
  var image;
  String? passportNum;
  String? passportIssueDate;
  String? passportExpiryDate;
  int? isOffer;
  int? amountAfterDiscount;
  int? waitingList;
  String? waitingEnd;
  int? available;
  int? refund;
  int? nationalityId;
  int? birthPlace;
  int? livingTown;
  int? passportPlaceOfIssue;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  int? complexionId;
  int? religionId;
  int? maritalStatus;
  int? educationCertification;
  String? favourite;
  List<LanguageModel>? languages = [];
  List<JobModel>? jobs = [];

  EmployeeModel({
    this.id,
    this.name,
    this.dateOfBirth,
    this.timeWorkPerDay,
    this.hourSalary,
    this.numOfChildren,
    this.hight,
    this.weight,
    this.salaryMonth,
    this.numberYearContract,
    this.contractAmount,
    this.contractDuration,
    this.previousWorkAbroad,
    this.durationOfEmployment,
    this.image,
    this.passportNum,
    this.passportIssueDate,
    this.passportExpiryDate,
    this.isOffer,
    this.amountAfterDiscount,
    this.waitingList,
    this.waitingEnd,
    this.available,
    this.refund,
    this.nationalityId,
    this.birthPlace,
    this.livingTown,
    this.passportPlaceOfIssue,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.complexionId,
    this.religionId,
    this.maritalStatus,
    this.educationCertification,
    this.favourite,
    this.languages,
    this.jobs,
  }) {
    languages = [];
    jobs = [];
  }

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    timeWorkPerDay = json['time_work_per_day'];
    hourSalary = json['hour_salary'];
    numOfChildren = json['num_of_children'];
    hight = json['hight'];
    weight = json['weight'];
    salaryMonth = json['salary_month'];
    numberYearContract = json['number_year_contract'];
    contractAmount = json['contract_amount'];
    contractDuration = json['contract_duration'];
    previousWorkAbroad = json['previous_work_abroad'];
    durationOfEmployment = json['duration_of_employment'];
    image =
        "https://wazzfny.online/api/files/images/employees/${json['image']}";
    passportNum = json['passport_num'];
    passportIssueDate = json['passport_issue_date'];
    passportExpiryDate = json['passport_expiry_date'];
    isOffer = json['is_offer'];
    amountAfterDiscount = json['amount_after_discount'];
    waitingList = json['waiting_list'];
    waitingEnd = json['waiting_end'];
    available = json['available'];
    refund = json['refund'];
    nationalityId = json['nationality_id'];
    birthPlace = json['birth_place'];
    livingTown = json['living_town'];
    passportPlaceOfIssue = json['passport_place_of_issue'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    complexionId = json['complexion_id'];
    religionId = json['religion_id'];
    maritalStatus = json['marital_status'];
    educationCertification = json['education_certification'];
    favourite = json['favourite'];
    if (json['languages'] != null) {
      languages = <LanguageModel>[];
      json['languages'].forEach((v) {
        languages!.add(LanguageModel.fromJson(v));
      });
    }
    if (json['jobs'] != null) {
      jobs = <JobModel>[];
      json['jobs'].forEach((v) {
        jobs!.add(JobModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (dateOfBirth != null) data['date_of_birth'] = dateOfBirth;
    if (timeWorkPerDay != null) data['time_work_per_day'] = timeWorkPerDay;
    if (hourSalary != null) data['hour_salary'] = hourSalary;
    if (numOfChildren != null) data['num_of_children'] = numOfChildren;
    if (hight != null) data['hight'] = hight;
    if (weight != null) data['weight'] = weight;
    if (salaryMonth != null) data['salary_month'] = salaryMonth;
    if (numberYearContract != null) {
      data['number_year_contract'] = numberYearContract;
    }
    if (contractAmount != null) data['contract_amount'] = contractAmount;
    if (contractDuration != null) data['contract_duration'] = contractDuration;
    if (previousWorkAbroad != null) {
      data['previous_work_abroad'] = previousWorkAbroad;
    }
    if (durationOfEmployment != null) {
      data['duration_of_employment'] = durationOfEmployment;
    }
    if (passportNum != null) data['passport_num'] = passportNum;
    if (passportIssueDate != null) {
      data['passport_issue_date'] = passportIssueDate;
    }
    if (passportExpiryDate != null) {
      data['passport_expiry_date'] = passportExpiryDate;
    }
    if (isOffer != null) data['is_offer'] = isOffer;
    if (amountAfterDiscount != null) {
      data['amount_after_discount'] = amountAfterDiscount;
    }
    if (waitingList != null) data['waiting_list'] = waitingList;
    if (waitingEnd != null) data['waiting_end'] = waitingEnd;
    if (available != null) data['available'] = available;
    if (refund != null) data['refund'] = refund;
    if (nationalityId != null) data['nationality_id'] = nationalityId;
    if (birthPlace != null) data['birth_place'] = birthPlace;
    if (livingTown != null) data['living_town'] = livingTown;
    if (passportPlaceOfIssue != null) {
      data['passport_place_of_issue'] = passportPlaceOfIssue;
    }
    if (companyId != null) data['company_id'] = companyId;
    if (createdAt != null) data['created_at'] = createdAt;
    if (updatedAt != null) data['updated_at'] = updatedAt;
    if (complexionId != null) data['complexion_id'] = complexionId;
    if (religionId != null) data['religion_id'] = religionId;
    if (maritalStatus != null) data['marital_status'] = maritalStatus;
    if (educationCertification != null) {
      data['education_certification'] = educationCertification;
    }
    if (favourite != null) data['favourite'] = favourite;

    for (var i = 0; i < languages!.length; i++) {
      data["languages[$i]"] = languages![i].id;
    }
    for (var i = 0; i < jobs!.length; i++) {
      data["jobs[$i]"] = jobs![i].id;
    }
    // data['languages'] = languages!.map((e) => e.id).toList();
    // data['jobs'] = jobs!.map((e) => e.id).toList();
    return data;
  }
}
