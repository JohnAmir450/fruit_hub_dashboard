import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dashboard/core/utils/spacing.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_checkbox.dart';

class IsFeaturedCheckBox extends StatefulWidget {
final ValueChanged<bool> onChanged;
   const IsFeaturedCheckBox({super.key, required this.onChanged});

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      CustomCheckBox(onChecked:(value){
        setState(() {
          isChecked = value;
          widget.onChanged(value);
        });
      } ,isChecked:isChecked ,),
      horizontalSpace(16),
       Text('Featured Product ?',style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),)
    ],);
  }
}