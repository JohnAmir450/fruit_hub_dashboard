import 'package:fruit_hub_dashboard/core/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firesotre = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      String? uId,
      required Map<String, dynamic> data}) async {
    if (uId != null) {
       firesotre.collection(path).doc(uId).set(data);
    } else {
      await firesotre.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String uId}) async {
    var data = await firesotre.collection(path).doc(uId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExist(
      {required String path, required String uId}) async {
    var data = await firesotre.collection(path).doc(uId).get();
    return data.exists;
  }
}
