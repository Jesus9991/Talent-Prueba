import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
provider para las personas destacadas en el home
*/
class HightPersonsHomeProvider extends ChangeNotifier {
  /*inicia los datos al llamar al provider*/
  HightPersonsHomeProvider() {
    getListHightLight();
  }

  /*modelo de los datos*/
  HightlightPersonHomeModels _personHomeModels = HightlightPersonHomeModels(
    count: 0,
    key: 'top_pitches',
    data: [],
    title: '',
  );

  bool _isLoading = false;
  String? _errorMessage;
  /*seteo de datos*/
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  HightlightPersonHomeModels get personHomeModels => _personHomeModels;

  //seteo de datos
  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  //*PETICION PARA OBTENER LA LISTA DE DESTACADOS DEL HOME
  Future getListHightLight() async {
    try {
      setIsLoading(true);

      final url = Uri.parse('${UrlApiPath.urlHttp}${PathApi.hightlightPath}');
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
          _personHomeModels = HightlightPersonHomeModels.fromJson(data);
          log('getListHightLight id:  ${_personHomeModels.data[0].id}');
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
  //!!!Todo: hacer peticion para el detalle de uno !
}
