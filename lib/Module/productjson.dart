// To parse this JSON data, do
//
//     final productApi = productApiFromJson(jsonString);


import 'dart:convert';

List<ProductApi> productApiFromJson(String str) => List<ProductApi>.from(json.decode(str).map((x) => ProductApi.fromJson(x)));

String productApiToJson(List<ProductApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductApi {
  ProductApi({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.descriptionEn,
    this.descriptionAr,
    this.price,
    this.price2,
    this.status,
    this.storeId,
    this.categoryId,
    this.subCategoryId,
  });

  final String id;
  final String nameEn;
  final String nameAr;
  final dynamic image;
  final dynamic descriptionEn;
  final dynamic descriptionAr;
  final String price;
  final String price2;
  final String status;
  final String storeId;
  final String categoryId;
  final String subCategoryId;

  factory ProductApi.fromJson(Map<String, dynamic> json) => ProductApi(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    image: json["image"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    price: json["price"],
    price2: json["price2"],
    status: json["status"],
    storeId: json["store_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "image": image,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "price": price,
    "price2": price2,
    "status": status,
    "store_id": storeId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
  };
}
