import 'package:flutter/material.dart';

/*
PROVIDER: para cargar las listas creadas por el usuario y todos los videos guardados
*/
class PlaylistUserProvider extends ChangeNotifier {
  /*index para mostrar el tab */
  int _selectTabBar = 0;
  int get selectTabBar => _selectTabBar;

  setSelectTabBar(bool view) {
    if (view == true) {
      _selectTabBar = 0;
    } else {
      _selectTabBar = 1;
    }
    notifyListeners();
  }
}
