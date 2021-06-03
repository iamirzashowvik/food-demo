//     final setMenu = setMenuFromJson(jsonString);
import 'dart:convert';

List<SetMenu> setMenuFromJson(String str) => List<SetMenu>.from(json.decode(str).map((x) => SetMenu.fromJson(x)));

String setMenuToJson(List<SetMenu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SetMenu {
  SetMenu({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.variations,
    this.addOns,
    this.tax,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.attributes,
    this.categoryIds,
    this.choiceOptions,
    this.discount,
    this.discountType,
    this.taxType,
    this.setMenu,
    this.rating,
  });

  int id;
  String name;
  String description;
  String image;
  int price;
  List<Variation> variations;
  List<AddOn> addOns;
  double tax;
  String availableTimeStarts;
  String availableTimeEnds;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> attributes;
  List<CategoryId> categoryIds;
  List<ChoiceOption> choiceOptions;
  int discount;
  String discountType;
  String taxType;
  int setMenu;
  List<Rating> rating;

  factory SetMenu.fromJson(Map<String, dynamic> json) => SetMenu(
    id: json["id"],
    name: json["name"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"],
    price: json["price"],
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    addOns: List<AddOn>.from(json["add_ons"].map((x) => AddOn.fromJson(x))),
    tax: json["tax"].toDouble(),
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    attributes: List<String>.from(json["attributes"].map((x) => x)),
    categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
    choiceOptions: List<ChoiceOption>.from(json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
    discount: json["discount"],
    discountType: json["discount_type"],
    taxType: json["tax_type"],
    setMenu: json["set_menu"],
    rating: List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description == null ? null : description,
    "image": image,
    "price": price,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    "add_ons": List<dynamic>.from(addOns.map((x) => x.toJson())),
    "tax": tax,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
    "choice_options": List<dynamic>.from(choiceOptions.map((x) => x.toJson())),
    "discount": discount,
    "discount_type": discountType,
    "tax_type": taxType,
    "set_menu": setMenu,
    "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
  };
}

class AddOn {
  AddOn({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int price;
  DateTime createdAt;
  DateTime updatedAt;

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class CategoryId {
  CategoryId({
    this.id,
    this.position,
  });

  String id;
  int position;

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}

class ChoiceOption {
  ChoiceOption({
    this.name,
    this.title,
    this.options,
  });

  String name;
  String title;
  List<String> options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
    name: json["name"],
    title: json["title"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

class Rating {
  Rating({
    this.average,
    this.productId,
  });

  String average;
  int productId;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    average: json["average"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "average": average,
    "product_id": productId,
  };
}

class Variation {
  Variation({
    this.type,
    this.price,
  });

  String type;
  int price;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    type: json["type"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
  };
}
