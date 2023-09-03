class LanguageModel {
  int? id;
  String? name;
  String? shortName;
  String? slug;

  LanguageModel({this.id, this.name, this.shortName, this.slug});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['slug'] = this.slug;
    return data;
  }
}
