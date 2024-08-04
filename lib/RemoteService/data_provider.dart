
import 'package:flutter/foundation.dart';
import 'package:shop/RemoteService/api_service.dart';

import '../model/UserAcc.dart';

class DataProvider with ChangeNotifier {
 // final ApiService _apiService = ApiService();
  User? _data;
  String? _errorMessage;
  bool _isLoading = false;

  User? get data => _data;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchData(String path) async {
    _isLoading = true;
    notifyListeners();
    try {
      _data = await ApiService().fetchData(path);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = error.toString();
      _data = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
