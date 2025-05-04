
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductModel extends Equatable {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  //
  // factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
  //   id: json["id"],
  //   title: json["title"],
  //   price: json["price"]?.toDouble(),
  //   description: json["description"],
  //   category:json["category"],
  //   image: json["image"],
  //   rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  // );
  //
  // Map<String, dynamic> toMap() => {
  //   "id": id,
  //   "title": title,
  //   "price": price,
  //   "description": description,
  //   "category":category,
  //   "image": image,
  //   "rating": rating?.toJson(),
  // };
factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category:json["category"],
    image: json["image"],
  rating: json["rating"] is Map<String, dynamic>
      ? Rating.fromJson(json["rating"])
      : null,
);

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category":category,
    "image": image,
    "rating": rating?.toJson(),
  };

  @override

  List<Object?> get props => [id , title , price , description , category , image , rating];
}



class Rating extends Equatable {
  final double? rate;
  final int? count;

  const Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };

  @override
  List<Object?> get props => [rate, count];
}



