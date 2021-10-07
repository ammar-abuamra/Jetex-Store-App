// To parse this JSON data, do
//
//     final maininfo = maininfoFromJson(jsonString);

import 'dart:convert';

List<Maininfo> maininfoFromJson(String str) => List<Maininfo>.from(json.decode(str).map((x) => Maininfo.fromJson(x)));

String maininfoToJson(List<Maininfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Maininfo {
  Maininfo({
    this.nameEn,
    this.nameAr,
    this.storeLocation,
    this.phoneNumber,
  });


  final String nameEn;
  final dynamic nameAr;
  final dynamic storeLocation;
  final dynamic phoneNumber;

  factory Maininfo.fromJson(Map<String, dynamic> json) => Maininfo(
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    storeLocation: json["store_location"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "name_en": nameEn,
    "name_ar": nameAr,
    "store_location": storeLocation,
    "phone_number": phoneNumber,
  };
}
