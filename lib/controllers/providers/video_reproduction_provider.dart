import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class VideoReproductionProvider extends ChangeNotifier {
  final Map<String, VideoPlayerController> _controllers = {};
  final Map<String, ValueNotifier<Duration>> _progressNotifiers = {};
  final Map<String, bool> _isLoaded = {};
  final Map<String, bool> _isPlaying = {};

  final DefaultCacheManager _cacheManager = DefaultCacheManager();
  bool? _isLowQuality;

  /* constructor, inicializa la verificacion de la conexion */
  VideoReproductionProvider() {
    _checkConnectionSpeed();
  }

  /* verifica si la conexion es lenta (mobil) para usar videos de baja calidad */
  Future<void> _checkConnectionSpeed() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _isLowQuality = connectivityResult.contains(ConnectivityResult.mobile);
    notifyListeners();
  }

  /* obtiene el controlador de un video si ya fue cargado */
  VideoPlayerController? getController(String url) => _controllers[url];

  /* obtiene el notificador del progreso del video */
  ValueNotifier<Duration>? getProgressNotifier(String url) =>
      _progressNotifiers[url];

  /* verifica si un video ya fue cargado en memoria */
  bool isVideoLoaded(String url) => _isLoaded[url] ?? false;

  /* verifica si un video esta reproduciendose */
  bool isPlaying(String url) => _isPlaying[url] ?? false;

  /* inicializa el video, verificando si hay una version en cache o si debe cargarlo de internet */
  Future<void> initializeVideo(String url) async {
    if (_controllers.containsKey(url) || _isLowQuality == null) return;

    String finalUrl = _isLowQuality! ? url.replaceAll('.mp4', '_low.mp4') : url;

    try {
      File cachedFile = await _cacheManager.getSingleFile(finalUrl);
      _controllers[url] = cachedFile.existsSync()
          ? VideoPlayerController.file(cachedFile)
          : VideoPlayerController.networkUrl(Uri.parse(finalUrl));

      await _controllers[url]!.initialize();
      _isLoaded[url] = true;

      // inicializa el notificador del progreso del video
      _progressNotifiers[url] = ValueNotifier(Duration.zero);
      _controllers[url]!.addListener(() {
        _progressNotifiers[url]!.value = _controllers[url]!.value.position;
        notifyListeners();
      });

      notifyListeners();
    } catch (e) {
      debugPrint("Error al cargar video: $e");
    }
  }

  /* reproduce el video si está pausado */
  void playVideo(String url) {
    _controllers[url]?.play();
    _isPlaying[url] = true;
    notifyListeners();
  }

  /* pausa el video si está en reproducción */
  void pauseVideo(String url) {
    _controllers[url]?.pause();
    _isPlaying[url] = false;
    notifyListeners();
  }

  /* adelanta o retrocede el video a una posición específica */
  void seekTo(String url, Duration position) {
    _controllers[url]?.seekTo(position);
    playVideo(url);
    notifyListeners();
  }

  /* libera memoria eliminando el controlador del video cuando ya no es necesario */
  void disposeController(String url) {
    _controllers[url]?.dispose();
    _controllers.remove(url);
    _progressNotifiers.remove(url);
    _isLoaded.remove(url);
    _isPlaying.remove(url);
    notifyListeners();
  }

  /* libera todos los controladores cuando se cierra la app */
  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
