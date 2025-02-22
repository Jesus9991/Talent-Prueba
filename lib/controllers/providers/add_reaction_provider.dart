import 'package:flutter/material.dart';

/*
PROVIDER: añadir reaccion en el banner del home
*/
class AddReactionProvider extends ChangeNotifier {
  bool _isFavorite = false;
  int _reactionCount = 2;

  bool get isFavorite => _isFavorite;
  int get reactionCount => _reactionCount;

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    _isFavorite ? _reactionCount++ : _reactionCount--;
    notifyListeners();
  }
}
