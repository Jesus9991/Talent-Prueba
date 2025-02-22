import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';

/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const navBarRoute = '/nav_bar_route';
  /*pantalla iniciales en el home */
  static const homeScreenRoutes = '/home_favorites_routes';
  static const profileScreenRoutes = '/profile_user_routes';
  static const discoverScreenRoutes = '/discover_routes';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA DEL NAVBAR------*/
    navBarRoute: (_) => NavBarAppWidgets(),

    /*-----RUTA INICIAL------*/
    homeScreenRoutes: (_) => const HomeScreen(),
    profileScreenRoutes: (_) => const ProfileUserScreen(),
    discoverScreenRoutes: (_) => const DiscoverVideosScreen(),
  };
}
