import 'dart:async';
import 'package:flutter/material.dart';

/*
PROVIDER: para manejar el tiempo visibilidad de los icono para el video 
*/
class VideoControlProvider extends ChangeNotifier {
  /*el estado que controla si los controles estan visibles o no */
  bool _showControls = true;

  /*tempo que oculta los controles despues de un tiempo */
  Timer? _hideControlsTimer;

  /*getter para acceder al estado de visibilidad de los controles */
  bool get showControls => _showControls;

  /*vvariable para permitir el reinicio manual del temporizador */
  bool _canRestartTimer = true;
  bool get canRestartTimer => _canRestartTimer;

  /*constructor: inicia el temporizador automaticamente al crear la instancia */
  VideoControlProvider() {
    _startHideControlsTimer();
  }

  /*metodo para alternar la visibilidad de los controles y reiniciar el temporizador */
  void toggleControls() {
    _showControls = true;
    notifyListeners();
    _startHideControlsTimer();
  }

  /*meotodo para iniciar o reiniciar el temporizador de ocultamiento */
  void _startHideControlsTimer() {
    if (!_canRestartTimer) return;

    _hideControlsTimer?.cancel(); // Cancela cualquier temporizador activo
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      _showControls = false;
      notifyListeners();
    });
  }

  /*metodo para reiniciar el temporizador manualmente */
  void resetTimer() {
    _canRestartTimer = true;
    _startHideControlsTimer();
  }

  /*metodo para bloquear el reinicio del temporizador (por ejemplo, si se desea mantener los controles visibles) */
  void disableTimerRestart() {
    _canRestartTimer = false;
  }

/*cancela el temporizador al eliminar el provider */
  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    super.dispose();
  }
}
