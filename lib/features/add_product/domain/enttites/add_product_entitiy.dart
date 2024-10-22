import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/enttites/review_entity.dart';

class AddProductEntity {
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
  final List<ReviewEntity>reviews;

  AddProductEntity({
    required this.numberOfCalories,
    required this.expirationMonths,
    required this.isOrganic,
    required this.uintAmount,
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    this.fileImage,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews,
  });
}
