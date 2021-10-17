import 'dart:convert';

List<Orderapi> orderapiFromJson(String str) =>
    List<Orderapi>.from(json.decode(str).map((x) => Orderapi.fromJson(x)));

String orderapiToJson(List<Orderapi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orderapi {
  Orderapi({
    this.id,
    this.orderNumber,
    this.status,
  });

  final int id;
  final int orderNumber;
  final int status;

  factory Orderapi.fromJson(Map<String, dynamic> json) => Orderapi(
        id: json["id"],
        orderNumber: json["order_number"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "status": status,
      };
}
