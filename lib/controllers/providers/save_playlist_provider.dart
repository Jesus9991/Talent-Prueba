import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
PROVIDER: guarda, obtiene, consulta la playlist
*/
class SavePlaylistProvider extends ChangeNotifier {
  /*sql */
  final PlayListSQLService _dbService = PlayListSQLService.instance;
  /*lista de videos */
  List<PlayListModels> _playlists = [];
  List<PortfolioForVideosModels> _savedVideos = [];

  List<PlayListModels> get playlists => List.unmodifiable(_playlists);
  List<PortfolioForVideosModels> get savedVideos =>
      List.unmodifiable(_savedVideos);

  Set<int> _saveVideoIds = {}; // guarda los IDs en memoria.
  Set<int> get saveVideoIds => _saveVideoIds;

  bool _isloading = false;
  bool get isloading => _isloading;

  setLoading(bool isload) {
    _isloading = isload;
    notifyListeners();
  }

  SavePlaylistProvider() {
    loadPlaylists();
    loadSavedVideos();
  }

  saveForVideo({
    required int id,
    required String name,
    required String slug,
    required String avatar,
    required String video,
  }) async {
    /*verifica si ya está en favoritos */
    final saveVideo = _saveVideoIds.contains(id);
    if (saveVideo) {
      /*si ya es favorito lo elimina */
      await _dbService.deletePortfolio(id);
      _saveVideoIds.remove(id);
    } else {
      /*si no es favorito, guardarlo */
      PortfolioForVideosModels videoModel = PortfolioForVideosModels(
        id: id,
        name: name,
        slug: slug,
        avatar: avatar,
        videoUrl: video,
      );
      await _dbService.insertPortfolio(videoModel.toMap());
      _saveVideoIds.add(id);
    }
    notifyListeners();
  }

  bool isSaveVideo(int id) {
    return _saveVideoIds.contains(id);
  }

  /*cargar playlists desde la base de datos */
  Future<void> loadPlaylists() async {
    setLoading(true);
    final data = await _dbService.getPlaylists();
    _playlists = data
        .map((e) =>
            PlayListModels(id: e['id'], name: e['name'], portfolioIds: []))
        .toList();
    setLoading(false);

    notifyListeners();
  }

  /*cargar videos guardados desde la base de datos */
  Future<void> loadSavedVideos() async {
    // setLoading(true);

    final data = await _dbService.getPortfolios();
    _savedVideos =
        data.map((e) => PortfolioForVideosModels.fromJson(e)).toList();
    _saveVideoIds = _savedVideos.map((e) => e.id).toSet();

    setLoading(false);

    notifyListeners();
  }

  /*guarda un video individualmente */
  Future<void> saveVideo(PortfolioForVideosModels video) async {
    await _dbService.insertPortfolio(video.toMap());
    _savedVideos.add(video);
    notifyListeners();
  }

  /*añadir video a una playlist específica o a todas si no se elige */
  Future<void> addVideoToPlaylist(int videoId, {int? playlistId}) async {
    if (playlistId == null) {
      for (var playlist in _playlists) {
        await _dbService.addVideoToPlaylist(playlist.id, videoId);
        if (!playlist.portfolioIds.contains(videoId)) {
          playlist.portfolioIds.add(videoId);
        }
      }
    } else {
      await _dbService.addVideoToPlaylist(playlistId, videoId);
      int index =
          _playlists.indexWhere((playlist) => playlist.id == playlistId);
      if (index != -1 && !_playlists[index].portfolioIds.contains(videoId)) {
        _playlists[index].portfolioIds.add(videoId);
      }
    }
    notifyListeners();
  }

  /*retornar todos los videos guardados */
  List<PortfolioForVideosModels> getAllSavedVideos() {
    return List.unmodifiable(_savedVideos);
  }

  /*obtiene los videos de una playlist específica */
  Future<List<PortfolioForVideosModels>> getVideosFromPlaylist(
      int playlistId) async {
    final data = await _dbService.getPlaylistVideos(playlistId);
    return data.map((e) => PortfolioForVideosModels.fromJson(e)).toList();
  }

  /*añade una nueva playlist */
  Future<void> addPlaylist(String name) async {
    final id = await _dbService.createPlaylist(name);
    _playlists.add(PlayListModels(id: id, name: name, portfolioIds: []));
    notifyListeners();
  }

  /*elimina una playlist */
  Future<void> removePlaylist(int id) async {
    await _dbService.deletePlaylist(id);
    _playlists.removeWhere((playlist) => playlist.id == id);
    notifyListeners();
  }

  /*obtiene la lista de playlists */
  Future<List<PlayListModels>> getAllPlaylists() async {
    final data = await _dbService.getPlaylists();
    return data
        .map((e) =>
            PlayListModels(id: e['id'], name: e['name'], portfolioIds: []))
        .toList();
  }
}
