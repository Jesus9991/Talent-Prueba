import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
PROVIDER: provider para manejar la lista de categorias
*/
class CategoriesListProvider extends ChangeNotifier {
/*lista de categorias*/
  List<ListCategoryModels> _categories = [];
  List<ListCategoryModels> get categories => _categories;

  /*carga las listas de categorias al modelo */
  CategoriesListProvider() {
    loadCategories();
  }

  /*carga la lista de las categorias*/
  void loadCategories() {
    final List<dynamic> decodedData = jsonDecode(CategorysList.listCategories);

    _categories =
        decodedData.map((e) => ListCategoryModels.fromJson(e)).toList();
    notifyListeners();
  }

  /*selecciona la categoria*/
  int _selectCategory = 0;
  int get selectCategory => _selectCategory;

  setSelectCategory(int index) {
    _selectCategory = index; //selecciona la categoria
    notifyListeners();
  }
}
