import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/extentions.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/routes.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CustomButton(text: 'Add Product',onPressed: (){
          context.pushNamed(Routes.addProductView);
        },)
      ],),
    );
  }
}