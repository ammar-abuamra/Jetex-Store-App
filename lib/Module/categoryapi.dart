// To parse this JSON data, do
//
//     final categoryapi = categoryapiFromJson(jsonString);

import 'dart:convert';

List<Categoryapi> categoryapiFromJson(String str) => List<Categoryapi>.from(json.decode(str).map((x) => Categoryapi.fromJson(x)));

String categoryapiToJson(List<Categoryapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoryapi {
  Categoryapi({
    this.id,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String nameEn;
  final String nameAr;
  final dynamic descriptionEn;
  final dynamic descriptionAr;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Categoryapi.fromJson(Map<String, dynamic> json) => Categoryapi(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
