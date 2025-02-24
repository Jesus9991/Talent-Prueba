import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
PROVIDER: provider para manejar la lista de categorias
*/
class CategoriesListProvider extends ChangeNotifier {
/*lista de categorias*/
  CategoriesHomeModel _categories = CategoriesHomeModel(
    count: 0,
    data: [],
    limit: 10,
    page: 1,
  );

  bool _isLoading = false;
  String? _errorMessage;
  /*selecciona la categoria*/
  int _selectCategory = 0;
  bool _isTapCategory = false;
  String _categorySelected = '';

  /*seteo de datos de categorias*/
  int get selectCategory => _selectCategory;
  bool get isTapCategory => _isTapCategory;
  String get categorySelected => _categorySelected;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  CategoriesHomeModel get categories => _categories;

  /*carga las listas de categorias al modelo */
  CategoriesListProvider() {
    getFetchCategories();
  }

  //seteo de datos
  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  setSelectCategory(int? index, [String keyCategorie = '']) {
    if (index == -1) {
      // cuando selecciona "Ver todas"
      _selectCategory = -1;
      _categorySelected = '';
      _isTapCategory = false; // einiciar estado de selección
    } else {
      if (_selectCategory == index) {
        // Si la categoría ya estaba seleccionada, vuelve a "Ver todas"
        _selectCategory = -1;
        _categorySelected = '';
        _isTapCategory = false;
      } else {
        // Seleccionar una categoría específica
        _selectCategory = index ?? -1;
        _categorySelected = keyCategorie;
        _isTapCategory = true;
      }
    }

    log('setSelectCategory: $_selectCategory y key: $_categorySelected');
    notifyListeners();
  }

  setisTapCategory(bool isSelect) {
    _isTapCategory =
        isSelect; //para saber si el usuario selecciono una categoria
    notifyListeners();
  }

  //*OBTIENE LA LISTA DE CATEGORIAS
  Future getFetchCategories() async {
    try {
      final url =
          Uri.parse('${UrlApiPath.urlHttp}${PathApi.listCategories}?limit=10');
      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
        },
      );

      /*si el codigo es 200 añade la respuesta al modelo */
      if (response.statusCode >= 200 && response.statusCode < 300) {
        /* decodifica la respuesta JSON */
        final data = json.decode(response.body);

        /*verifica que la respuesta sea válida antes de parsear */
        if (data is Map<String, dynamic>) {
          /*llena los datos */
          _categories = CategoriesHomeModel.fromJson(data);
          /*cambio de estado */
          setErrorMessage(null);
        } else {
          setErrorMessage('Error en el json de data');
        }

        notifyListeners();
      } else {
        setErrorMessage('Error en la solicitud: ${response.statusCode}');
        log('error en getFetchCategories ${response.statusCode}');
      }
    } on TimeoutException {
      /*demasiado tarde en responder */
      setErrorMessage("La solicitud tardó demasiado en responder.");
      log("Timeout en la solicitud.");
    } on HttpException catch (e) {
      /*error en http */
      setErrorMessage(e.message);
      log("Error HTTP: $e");
    } on FormatException catch (e) {
      /*error en el formato de la respuesta */
      setErrorMessage("Error de formato en la respuesta: $e");
      log("Error de formato: $e");
    } catch (e) {
      /*erorr inesperado */
      setErrorMessage("Se produjo un error inesperado: $e");
      log("Error inesperado: $e");
    } finally {
      setIsLoading(false);
    }
  }
}
