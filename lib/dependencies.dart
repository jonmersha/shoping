
import 'package:get/get.dart';
import 'package:shop/RemoteService/controller/category_controller.dart';
import 'package:shop/RemoteService/controller/product_controller.dart';
import 'package:shop/RemoteService/controller/stock_bin_controller.dart';
import 'package:shop/RemoteService/controller/store_controller.dart';
import 'package:shop/RemoteService/controller/user_controller.dart';
import 'package:shop/RemoteService/repository/api_client.dart';
import 'package:shop/RemoteService/repository/repo_service.dart';

import 'package:shop/utils/app_constants.dart';

Future<void> init() async {

  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
  Get.lazyPut(() => Services(apIClient: Get.find()));

  Get.lazyPut(() => UserController(serviceRepo: Get.find()));
  Get.lazyPut(() => ProductController(serviceRepo: Get.find()));
  Get.lazyPut(() => CategoryController(serviceRepo: Get.find()));
  Get.lazyPut(() => StoreController(serviceRepo: Get.find()));
  Get.lazyPut(() => StockBinController(serviceRepo: Get.find()));

}
