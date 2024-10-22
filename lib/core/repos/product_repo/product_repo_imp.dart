import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/data_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/enttites/add_product_entitiy.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductEntity addProductEntity) async {
    try {
  await databaseService.addData(
    path: BackendEndpoints.products,
    data: AddProductModel.fromEntity(addProductEntity).toJson(),
  );
  return const Right(null);
}  catch (e) {
  return Left(ServerFailure(message: e.toString()));
}
  }
}
