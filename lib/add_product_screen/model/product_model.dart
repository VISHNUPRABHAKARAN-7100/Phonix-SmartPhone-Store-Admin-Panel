// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.products,
  });

  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    required this.productname,
    required this.price,
    required this.mrp,
    required this.stock,
    required this.brand,
    required this.category,
    required this.description,
    this.isDeleted = false,
    required this.image,
  });

  String? id;
  String productname;
  int price;
  int mrp;
  int stock;
  String brand;
  String category;
  String description;
  bool? isDeleted;
  List<Image> image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productname: json["productname"],
        price: json["price"],
        mrp: json["mrp"],
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        description: json["description"],
        isDeleted: json["isDeleted"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "price": price,
        "mrp": mrp,
        "stock": stock,
        "brand": brand,
        "category": category,
        "description": description,
        "isDeleted": isDeleted,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.url,
    required this.filename,
    required this.id,
  });

  String url;
  String filename;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        filename: json["filename"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "filename": filename,
        "_id": id,
      };
}
