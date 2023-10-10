import 'package:khedma/models/me.dart';

class CompanyRequest {
  int? id;
  int? companyId;
  int? available;
  String? name;
  Booking? status;
  DocumentModel? document;

  CompanyRequest(
      {this.id,
      this.companyId,
      this.available,
      this.name,
      this.status,
      this.document});

  CompanyRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    available = json['available'];
    name = json['name'];
    status = json['status'] != null ? Booking.fromJson(json['status']) : null;
    document = json['document'] != null
        ? DocumentModel.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['company_id'] = companyId;
    data['available'] = available;
    data['name'] = name;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (document != null) {
      data['document'] = document!.toJson();
    }
    return data;
  }
}

class DocumentModel {
  int? id;
  int? approve;
  int? userId;
  int? employeeId;
  Me? user;
  List<String>? names;
  List<String>? files;
  DocumentModel({
    this.id,
    this.approve,
    this.userId,
    this.employeeId,
    this.user,
    this.names,
    this.files,
  });

  DocumentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    approve = json['approve'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    user = json['user'] != null ? Me.fromJson(json['user']) : null;
    if (json['name'] != null) names = json['name'].cast<String>();
    if (json['file'] != null) {
      files = List<String>.from(json['file'])
          .map((e) => 'https://khdmah.online/api/images/documents/$e')
          .toList();
      ;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['approve'] = approve;
    data['user_id'] = userId;
    data['employee_id'] = employeeId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['name'] = names;
    data['file'] = files;
    return data;
  }
}
