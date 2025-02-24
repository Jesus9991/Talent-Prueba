import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*
PROVIDER: para el scroll de videos en discover
*/
class DiscoverVideosProvider extends ChangeNotifier {
  /*controlador para pageview*/
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 1,
  );
  final List<VideoPlayerController?> _videoControllers = [];

  int _currentIndex = 0;

  PageController get pageController => _pageController;
  List<VideoPlayerController?> get videoControllers => _videoControllers;

  void initializeVideos(List<String> videoUrls) {
    _videoControllers.clear();
    for (var url in videoUrls) {
      _videoControllers.add(VideoPlayerController.networkUrl(Uri.parse(url))
        ..initialize().then((_) {
          notifyListeners();
        }).catchError((error) {
          debugPrint("Error cargando video: $error");
        }));
    }
  }

  void playVideo(int index) {
    if (index != _currentIndex && _videoControllers[_currentIndex] != null) {
      _videoControllers[_currentIndex]?.pause();
    }
    _currentIndex = index;
    _videoControllers[index]?.play();
    notifyListeners();
  }

  void pauseVideo(int index) {
    _videoControllers[index]?.pause();
    notifyListeners();
  }

  void seekForward(int index) {
    final controller = _videoControllers[index];
    if (controller != null) {
      controller
          .seekTo(controller.value.position + const Duration(seconds: 10));
    }
    notifyListeners();
  }

  void seekBackward(int index) {
    final controller = _videoControllers[index];
    if (controller != null) {
      controller
          .seekTo(controller.value.position - const Duration(seconds: 10));
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }
}
