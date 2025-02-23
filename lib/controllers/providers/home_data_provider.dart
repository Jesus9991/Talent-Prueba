import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
PROVIDER para manejar los datos del home
*/
class HomeDataProvider extends ChangeNotifier {
  /*inicia los datos al llamar al provider*/
  HomeDataProvider() {
    getFetchDataHome();
  }
  /*modelo de los datos*/
  HomeDataModel _homeDataModel = HomeDataModel(
    count: 0,
    data: [],
    limit: 0,
    page: 0,
  );

  bool _isLoading = false;
  String? _errorMessage;

  /*seteo de datos*/
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  HomeDataModel get homeDataModel => _homeDataModel;

  //seteo de datos
  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  //*PETICION PARA OBTENER LOS DATOS DEL HOME
  Future getFetchDataHome() async {
    try {
      final url = Uri.parse('${UrlApiPath.urlHttp}${PathApi.homePath}');
      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
        },
      );

      // print('response ${response.body}');

      /*si el codigo es 200 añade la respuesta al modelo */
      if (response.statusCode >= 200 && response.statusCode < 300) {
        /* decodifica la respuesta JSON */
        final data = json.decode(response.body);

        /*verifica que la respuesta sea válida antes de parsear */
        if (data is Map<String, dynamic>) {
          /*llena los datos */
          _homeDataModel = HomeDataModel.fromJson(data);
          /*cambio de estado */
          setErrorMessage(null);
        } else {
          setErrorMessage('Error en el json de data');
        }

        notifyListeners();
      } else {
        setErrorMessage('Error en la solicitud: ${response.statusCode}');
        log('error en banners ${response.statusCode}');
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
