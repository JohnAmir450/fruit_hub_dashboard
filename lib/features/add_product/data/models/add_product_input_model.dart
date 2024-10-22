import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/enttites/add_product_entitiy.dart';

class AddProductModel {
  final String name;
  final num price;
  final String description;
  final String code;
   File? fileImage;
  final bool isFeatured;
   String? imageUrl;
   final int expirationMonths;
   bool isOrganic=false;
  final int uintAmount;
  final int numberOfCalories;
   num avgRating=0;
   num ratingCount=0;
    int sellingCount=0;
   final List<ReviewModel>reviews;
  AddProductModel({
    required this.expirationMonths,
    required this.isOrganic,
    required this.uintAmount,
    required this.numberOfCalories,
    required this.name,
    required this.price,
    required this.description,
    this.sellingCount=0,
    required this.code,
     this.fileImage,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      code: json['code'],
      fileImage: json['fileImage'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      uintAmount: json['uintAmount'],
      numberOfCalories: json['numberOfCalories'],
      sellingCount: json['sellingCount'],
      reviews: List<ReviewModel>.from(json['reviews'].map((x) => ReviewModel.fromJson(x))),
    );
  }

  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
      name: addProductEntity.name,
      price: addProductEntity.price,
      description: addProductEntity.description,
      code: addProductEntity.code,
      fileImage: addProductEntity.fileImage,
      isFeatured: addProductEntity.isFeatured,
      imageUrl: addProductEntity.imageUrl,
      expirationMonths: addProductEntity.expirationMonths,
      isOrganic: addProductEntity.isOrganic,
      uintAmount: addProductEntity.uintAmount,
      numberOfCalories: addProductEntity.numberOfCalories,
      reviews: addProductEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'uintAmount': uintAmount,
      'sellingCount': sellingCount,
      'numberOfCalories': numberOfCalories,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
