import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/custom_snak_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        
        if (state is AddProductSuccessState) {
          
          showSnackBar(context, text: 'Product added successfully',color: AppColors.primaryColor);
        }
        if (state is AddProductFailureState) {
          {
            showSnackBar(context,
                text: state.errorMessage, color: Colors.red);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoadingState,
          progressIndicator:LoadingAnimationWidget.inkDrop(
          color: AppColors.secondaryColor, size: 32) ,
          child: const AddProductViewBody());
      },
    );
  }
}
