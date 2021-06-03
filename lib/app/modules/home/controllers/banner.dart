
//     final banner = bannerFromJson(jsonString);



import 'dart:convert';

List<Banner> bannerFromJson(String str) => List<Banner>.from(json.decode(str).map((x) => Banner.fromJson(x)));

String bannerToJson(List<Banner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banner {
  Banner({
    this.id,
    this.title,
    this.image,
    this.productId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
  });

  int id;
  String title;
  String image;
  int productId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    productId: json["product_id"] == null ? null : json["product_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"] == null ? null : json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "product_id": productId == null ? null : productId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_id": categoryId == null ? null : categoryId,
  };
}
