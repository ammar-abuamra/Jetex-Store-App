// To parse this JSON data, do
//
//     final insertimage = insertimageFromJson(jsonString);

import 'dart:convert';

List<Insertimage> insertimageFromJson(String str) => List<Insertimage>.from(json.decode(str).map((x) => Insertimage.fromJson(x)));

String insertimageToJson(List<Insertimage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Insertimage {
  Insertimage({
    this.id,
    this.storeId,
    this.imageName,
    this.imagePath,
  });

  final String id;
  final dynamic storeId;
  final dynamic imageName;
  final String imagePath;

  factory Insertimage.fromJson(Map<String, dynamic> json) => Insertimage(
    id: json["id"],
    storeId: json["store_id"],
    imageName: json["image_name"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "image_name": imageName,
    "image_path": imagePath,
  };
}
