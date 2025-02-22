import 'package:flutter/services.dart';
/*
efecto de vibracion en el dispositivo, feedback al usuario
*/

class VibrationEffectService {
  /*variable para manejar effecto */
  Future vibrationEffect() async {
    await HapticFeedback.lightImpact();
  }
}
