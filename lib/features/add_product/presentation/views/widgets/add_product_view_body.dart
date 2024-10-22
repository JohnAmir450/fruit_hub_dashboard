import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/custom_snak_bar.dart';
import 'package:fruit_hub_dashboard/core/utils/spacing.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/enttites/add_product_entitiy.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

import 'image_field.dart';
import 'is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  late String name, code, description;
  late num price,expirationMonths,unitAmount,numberOfCalories;
  bool isFeatured = false;
   bool isOrganic = false;
  File? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ), //EdgeInsets.all(8.0),
        child: Form(
          key: fromKey,
          //autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onChanged: (value) {
                  name = value;
                },
                hintText: 'Product Name',
              ),
              verticalSpace(16),
              CustomTextFormField(
                onChanged: (value) {
                  price = num.parse(value);
                },
                hintText: 'Price',
                textInputType: TextInputType.number,
              ),
              verticalSpace(16),
              CustomTextFormField(
                onChanged: (value) {
                  expirationMonths= num.parse(value);
                },
                hintText: 'Expiration Months',
                textInputType: TextInputType.number,
              ),
              verticalSpace(16),
               CustomTextFormField(
                onChanged: (value) {
                  numberOfCalories= num.parse(value);
                },
                hintText: 'Number of Calories',
                textInputType: TextInputType.number,
              ),
              verticalSpace(16),
              CustomTextFormField(
                onChanged: (value) {
                  unitAmount= num.parse(value);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              verticalSpace(16),
              CustomTextFormField(
                onChanged: (value) {
                  code = value.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              verticalSpace(16),
              CustomTextFormField(
                onChanged: (value) {
                  description = value;
                },
                hintText: 'Product description',
                maxLines: 5,
              ),
              verticalSpace(16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              verticalSpace(32),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                  print(isFeatured);
                },
              ),
              verticalSpace(32),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                
                },
              ),
              verticalSpace(32),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (fromKey.currentState!.validate()) {
                      fromKey.currentState!.save();
                      AddProductEntity input = addProductValues();
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      log('there was an error from view body');
                    }
                  } else {
                    showSnackBar(context, text: 'Image of product is required');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AddProductEntity addProductValues() {
    AddProductEntity input = AddProductEntity(
      reviews: [],
      isOrganic: isOrganic,
      uintAmount: unitAmount.toInt(),
      numberOfCalories: numberOfCalories.toInt(),
      expirationMonths: expirationMonths.toInt(),
      name: name,
      price: price,
      description: description,
      code: code,
      fileImage: image,
      isFeatured: isFeatured,
    );
    return input;
  }
}
