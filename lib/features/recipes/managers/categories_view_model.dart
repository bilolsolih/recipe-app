import 'package:flutter/material.dart';
import 'package:recipe/core/client.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel() {
    fetchCategories();
  }

  bool isCategoriesLoading = true;
  List categories = [];

  Future<void> fetchCategories() async {
    isCategoriesLoading = true;
    notifyListeners();

    var response = await dio.get('/categories/list');
    if (response.statusCode != 200) {
      notifyListeners();
      throw Exception('Kategoriyalarni olib kelishda xatolik.');
    }
    categories = response.data;
    isCategoriesLoading = false;
    notifyListeners();
  }
}
