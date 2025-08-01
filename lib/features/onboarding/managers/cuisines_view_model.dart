import 'package:flutter/material.dart';
import 'package:recipe/core/client.dart';

class CuisinesViewModel extends ChangeNotifier {
  CuisinesViewModel(){
    fetchCuisines();
  }


  String? errorText;
  bool isCuisinesLoading = false;
  List<Map<String, dynamic>> cuisines = [];

  Future<void> fetchCuisines() async {
    isCuisinesLoading = true;
    notifyListeners();

    var response = await dio.get('/cuisines/list');
    if (response.statusCode != 200) {
      errorText = response.data;
      isCuisinesLoading = false;
      notifyListeners();
    }

    cuisines = List<Map<String, dynamic>>.from(response.data);
    isCuisinesLoading = false;
    notifyListeners();
  }
}
