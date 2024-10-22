
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/enttites/add_product_entitiy.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;
  AddProductCubit(this.imagesRepo, this.productRepo)
      : super(AddProductInitialState());

  Future<void> addProduct(AddProductEntity addProductInputEntity) async {
    emit(AddProductLoadingState());
    var result = await imagesRepo.uploadImage(addProductInputEntity.fileImage!);
    result.fold(
      (f) {
        emit(
          AddProductFailureState(errorMessage:  f.message),
        );
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(
              AddProductFailureState(errorMessage:  f.message),
            );
          },
          (r) {
            emit(AddProductSuccessState());
          },
        );
      },
    );
  }
}
