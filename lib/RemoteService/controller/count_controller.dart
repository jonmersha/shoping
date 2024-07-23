import 'package:get/get.dart';
import 'package:shop/RemoteService/repository/repo_service.dart';
import 'package:shop/model/record_count.dart';
class CountController extends GetxController {
  final Services serviceRepo;
  CountController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(RecordCount.fromJson(response.body).data!);
      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
    }
  }
}
