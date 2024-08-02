import 'package:get/get.dart';
import 'package:shop/RemoteService/repository/repo_service.dart';
import 'package:shop/model/UserAcc.dart';


class UserController extends GetxController {
  final Services serviceRepo;
  UserController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool _isPosted=false;
  bool get isPosted => _isPosted;

  bool _isPostedError=false;
  bool get isPostedError => _isPostedError;


  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(User.fromJson(response.body).data!);
      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
  Future<void> addData(String path,dynamic data) async {
    Response response = await serviceRepo.addData(path,data);
    if (response.statusCode == 200) {
      _isPosted=true;
      update();
    } else {
      _isPostedError=true;
      _isPosted=false;
      update();
    }
  }
}
