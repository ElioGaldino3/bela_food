import 'dart:convert';

SizeModel sizeModelFromJson(String str) => SizeModel.fromJson(json.decode(str));

String sizeModelToJson(SizeModel data) => json.encode(data.toJson());

class SizeModel {
  int id;
  String size;
  double value;

  SizeModel({
    this.id,
    this.size,
    this.value,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
        id: json["id"],
        size: json["size"],
        value: double.parse(json["value"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "value": value,
      };

  static fromJsonList(List list) {
    if (list == null) return null;

    return list.map((json) => SizeModel.fromJson(json)).toList();
  }
}
