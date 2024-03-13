import 'package:hive_flutter/hive_flutter.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String brand;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final List<dynamic> images;
  @HiveField(7)
  String localId;
  static int i = 0;
  Product(
      {required this.brand,
      required this.description,
      required this.id,
      required this.images,
      required this.title,
      required this.price,
      required this.category,
      required this.localId});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      images: json['images'],
      title: json['title'],
      price: json['price'].toString(),
      category: json['category'],
      description: json['description'],
      brand: json["brand"],
      localId: i.toString(),
    );
  }
}
