import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';
/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const homeScreenRoutes = '/home_favorites_routes';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    homeScreenRoutes: (_) => const HomeScreen(),
  };
}
