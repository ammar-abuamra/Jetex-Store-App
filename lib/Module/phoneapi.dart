// To parse this JSON data, do
//
//     final phone = phoneFromJson(jsonString);

import 'dart:convert';

List<Phone> phoneFromJson(String str) => List<Phone>.from(json.decode(str).map((x) => Phone.fromJson(x)));

String phoneToJson(List<Phone> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Phone {
  Phone({
    this.id,
    this.storeId,
    this.phoneNumber,
  });

  final String id;
  final String storeId;
  final String phoneNumber;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    id: json["id"],
    storeId: json["store_id"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "phone_number": phoneNumber,
  };
}
