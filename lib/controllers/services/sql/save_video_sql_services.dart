// ignore_for_file: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*
SQL: para almacenar los videos guardados
*/
class PlayListSQLService {
  static final PlayListSQLService instance = PlayListSQLService._init();
  static Database? _database;

  PlayListSQLService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('portfolios.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 5,
      onCreate: _onCreateDB,
    );
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE portfolios (
       id INTEGER PRIMARY KEY,
        name TEXT,
        slug TEXT,
        avatar TEXT,
        video_url TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE playlists (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE playlist_videos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        playlistId INTEGER,
        portfolioId INTEGER,
        FOREIGN KEY (playlistId) REFERENCES playlists (id) ON DELETE CASCADE,
        FOREIGN KEY (portfolioId) REFERENCES portfolios (id) ON DELETE CASCADE
      )
    ''');
  }

  // CRUD para Portfolio
  Future<int> insertPortfolio(Map<String, dynamic> portfolio) async {
    final db = await database;
    return await db.insert(
      'portfolios',
      portfolio,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getPortfolios() async {
    final db = await database;
    return await db.query(
      'portfolios',
    );
  }

  Future<int> updatePortfolio(int id, Map<String, dynamic> portfolio) async {
    final db = await database;
    return await db.update(
      'portfolios',
      portfolio,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletePortfolio(int id) async {
    final db = await database;
    return await db.delete(
      'portfolios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD para Playlists
  Future<int> createPlaylist(String name) async {
    final db = await database;
    return await db.insert(
      'playlists',
      {
        'name': name,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getPlaylists() async {
    final db = await database;
    return await db.query('playlists');
  }

  Future<int> addVideoToPlaylist(int playlistId, int portfolioId) async {
    final db = await database;
    return await db.insert('playlist_videos', {
      'playlistId': playlistId,
      'portfolioId': portfolioId,
    });
  }

  Future<List<Map<String, dynamic>>> getPlaylistVideos(int playlistId) async {
    final db = await database;
    return await db.rawQuery('''
      SELECT p.* FROM portfolios p
      JOIN playlist_videos pv ON p.id = pv.portfolioId
      WHERE pv.playlistId = ?
    ''', [playlistId]);
  }

  Future<int> deletePlaylist(int id) async {
    final db = await database;
    return await db.delete('playlists', where: 'id = ?', whereArgs: [id]);
  }
}
