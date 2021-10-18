// To parse this JSON data, do
//
//     final productsApi = productsApiFromJson(jsonString);

import 'dart:convert';

List<ProductsApi> productsApiFromJson(String str) => List<ProductsApi>.from(
    json.decode(str).map((x) => ProductsApi.fromJson(x)));

String productsApiToJson(List<ProductsApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsApi {
  ProductsApi({
    this.id,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.price,
    this.image,
    this.discount,
  });

  final int id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final num price;
  final String image;
  final num discount;

  factory ProductsApi.fromJson(Map<String, dynamic> json) => ProductsApi(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    price: json["price"],
    image: json["image"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "price": price,
    "image": image,
    "discount": discount,
  };
}