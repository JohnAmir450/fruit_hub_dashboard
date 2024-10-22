import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart'as b;

class FireStorageService implements StorageService{
  final storageReference=FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file,String path)async {
    String fileName=b.basename(file.path);
    String extensionName=b.extension(file.path);
    var fileReference=storageReference.child('$path/$fileName.$extensionName');
    await fileReference.putFile(file);
    return fileReference.getDownloadURL();
  }
  
}