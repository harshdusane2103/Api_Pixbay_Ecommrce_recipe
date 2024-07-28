
import 'package:api_pixbay/Ecommrce/API/Ecommrce_Api.dart';
import 'package:api_pixbay/Ecommrce/Modal/Ecommrce_Modal.dart';
import 'package:flutter/material.dart';

class RecipesProvider extends ChangeNotifier {
  EcommerceModal? ecommerceModal;
ApiEcommerceHelper apiEcommerceHelper=ApiEcommerceHelper();
  int selectIndex = 0;
  int pageValue = 0;

  Future<EcommerceModal?> fromMap() async {
    final data = await apiEcommerceHelper.fetchApiData();
    ecommerceModal = EcommerceModal.fromJson(data);
    return ecommerceModal;
  }

  void selectedIndex(int index) {
    selectIndex = index;
    notifyListeners();
  }

  void Page(int value) {
    pageValue = value;
    notifyListeners();
  }
}

int selectedIndex = 0;
int pageValue = 0;

void setSelectedIndex(int index) {
  selectedIndex = index;
  notifyListeners();
}

void notifyListeners() {}

void setPageValue(int value) {
  pageValue = value;
  notifyListeners();
}
