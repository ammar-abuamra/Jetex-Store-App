// To parse this JSON data, do
//
//     final reviewmodule = reviewmoduleFromJson(jsonString);

import 'dart:convert';

List<Reviewmodule> reviewmoduleFromJson(String str) => List<Reviewmodule>.from(json.decode(str).map((x) => Reviewmodule.fromJson(x)));

String reviewmoduleToJson(List<Reviewmodule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reviewmodule {
  Reviewmodule({
    this.id,
    this.userId,
    this.storesId,
    this.rating,
    this.review,
    this.name,
    this.nameEn,
    this.nameAr,
  });

  final String id;
  final String userId;
  final String storesId;
  final String rating;
  final String review;
  final String name;
  final String nameEn;
  final dynamic nameAr;

  factory Reviewmodule.fromJson(Map<String, dynamic> json) => Reviewmodule(
    id: json["id"],
    userId: json["user_id"],
    storesId: json["stores_id"],
    rating: json["rating"],
    review: json["review"],
    name: json["name"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "stores_id": storesId,
    "rating": rating,
    "review": review,
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
  };
}
