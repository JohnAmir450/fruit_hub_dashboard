import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
  String url =
      await storageService.uploadImage(image, BackendEndpoints.images);
  
  return Right(url);
}  catch (e) {
  return Left(ServerFailure(message:'Failed to upload image'));
}
  }
}
