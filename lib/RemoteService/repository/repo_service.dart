import 'package:get/get.dart';
import 'package:shop/RemoteService/repository/api_client.dart';


class Services extends GetxService {
  final ApIClient apIClient;

  Services({required this.apIClient});
  Future<Response> getAll(String path) async {
    return await apIClient.getData(path);
  }
  Future<Response> getById(String path,int id) async {
    return await apIClient.getData('$path/?id=$id');
  }
  Future<Response> addData(String path,dynamic data) async {
    return await apIClient.addData(path,data);
  }


}
