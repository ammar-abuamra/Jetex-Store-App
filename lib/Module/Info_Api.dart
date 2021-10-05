// To parse this JSON data, do
//
//     final Infoapi = InfoapiFromJson(jsonString);

import 'dart:convert';

List<Infoapi> InfoapiFromJson(String str) => List<Infoapi>.from(json.decode(str).map((x) => Infoapi.fromJson(x)));

String InfoapiToJson(List<Infoapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Infoapi {
  Infoapi({
    this.id,
    this.storeLogo,
    this.storeLocation,
    this.nameEn,
    this.nameAr,
    this.password,
    this.storeType,
    this.rate,
    this.storeEmail,
    this.userId,
    this.phoneNumber,
    this.active,
    this.updatedAt,
    this.createdAt,
  });

  final String id;
  final String storeLogo;
  final dynamic storeLocation;
  final String nameEn;
  final dynamic nameAr;
  final String password;
  final String storeType;
  final dynamic rate;
  final dynamic storeEmail;
  final String userId;
  final dynamic phoneNumber;
  final String active;
  final String updatedAt;
  final String createdAt;

  factory Infoapi.fromJson(Map<String, dynamic> json) => Infoapi(
    id: json["id"],
    storeLogo: json["store_logo"],
    storeLocation: json["store_location"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    password: json["password"],
    storeType: json["store_type"],
    rate: json["rate"],
    storeEmail: json["store_email"],
    userId: json["user_id"],
    phoneNumber: json["phone_number"],
    active: json["active"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_logo": storeLogo,
    "store_location": storeLocation,
    "name_en": nameEn,
    "name_ar": nameAr,
    "password": password,
    "store_type": storeType,
    "rate": rate,
    "store_email": storeEmail,
    "user_id": userId,
    "phone_number": phoneNumber,
    "active": active,
    "updated_at": updatedAt,
    "created_at": createdAt,
  };
}
