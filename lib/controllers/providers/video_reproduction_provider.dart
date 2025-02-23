import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoReproductionProvider extends ChangeNotifier {
  /*video controladores*/
  final Map<String, VideoPlayerController> _controllers = {};
  final Map<String, bool> _isLoaded = {};

  /*obtiene el controlador de un video */
  VideoPlayerController? getController(String url) => _controllers[url];

  /*verifica si un video ya fue cargado */
  bool isVideoLoaded(String url) => _isLoaded[url] ?? false;

  /*inicializa el video cuando es visible */
  Future<void> initializeVideo(String url) async {
    if (_controllers.containsKey(url)) return;

    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller.initialize();
    _controllers[url] = controller;
    _isLoaded[url] = true;
    notifyListeners();
  }

  /*reproduce el video si está cargado */
  void playVideo(String url) {
    if (_controllers[url] != null) {
      _controllers[url]!.play();
      notifyListeners();
    }
  }

  /*pausa el video si está reproduciéndose */
  void pauseVideo(String url) {
    if (_controllers[url] != null) {
      _controllers[url]!.pause();
      notifyListeners();
    }
  }

  /*limpia los controladores al cerrar la app o cambiar de pantalla */
  void disposeController(String url) {
    _controllers[url]?.dispose();
    _controllers.remove(url);
    _isLoaded.remove(url);
    notifyListeners();
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
