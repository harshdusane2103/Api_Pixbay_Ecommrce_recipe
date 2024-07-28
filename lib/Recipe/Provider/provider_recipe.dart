import 'package:api_pixbay/Recipe/API/recipe_api.dart';
import 'package:api_pixbay/Recipe/Modal/recipe_modal.dart';
import 'package:flutter/material.dart';

class RecipesProvider extends ChangeNotifier {
  RecipesModal? recipesModal;
  ApiRecipeHelper apiRecipeHelper = ApiRecipeHelper();
  int selectIndex = 0;
  int pageValue = 0;

  Future<RecipesModal?> fromMap() async {
    final data = await apiRecipeHelper.fetchApiData();
    recipesModal = RecipesModal.fromJson(data);
    return recipesModal;
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
