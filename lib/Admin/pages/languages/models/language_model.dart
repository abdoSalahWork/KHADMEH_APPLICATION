import 'package:khedma/models/global_admin_items_model.dart';

class LanguageModel extends GlobalAdminItem {
  String? shortName;
  String? slug;

  LanguageModel(
      {int? id, String? nameEn, String? nameAr, this.shortName, this.slug})
      : super(id: id, nameAr: nameAr, nameEn: nameEn);

  LanguageModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    shortName = json['short_name'];
    slug = json['slug'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();

    data['short_name'] = shortName;
    data['slug'] = slug;
    return data;
  }
}
