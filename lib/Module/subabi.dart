// To parse this JSON data, do
//
//     final subapi = subapiFromJson(jsonString);

import 'dart:convert';

List<Subapi> subapiFromJson(String str) => List<Subapi>.from(json.decode(str).map((x) => Subapi.fromJson(x)));

String subapiToJson(List<Subapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subapi {
  Subapi({
    this.id,
    this.categoryId,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
  });

  final String id;
  final String categoryId;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final dynamic descriptionAr;

  factory Subapi.fromJson(Map<String, dynamic> json) => Subapi(
    id: json["id"],
    categoryId: json["category_id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name_en": nameEn,
    "name_ar": nameAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
  };
}
