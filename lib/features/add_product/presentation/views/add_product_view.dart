import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        getIt<ImagesRepo>(),
        getIt<ProductRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyles.bold23,
          ),
          centerTitle: true,
        ),
        body: const AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}

