import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _dbName = 'searchcep.db';
  static const _dbVersion = 1;

  static Database? _shared;

  AppDatabase._();

  static Future<AppDatabase> getInstance() async {
    if (_shared == null) {
      final dir = await getApplicationDocumentsDirectory();
      final path = join(dir.path, _dbName);

      _shared = await openDatabase(
        path,
        version: _dbVersion,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE cep_cache (
          cep TEXT PRIMARY KEY,
          logradouro TEXT,
          complemento TEXT,
          unidade TEXT,
          bairro TEXT,
          localidade TEXT,
          uf TEXT,
          estado TEXT,
          regiao TEXT,
          ibge TEXT,
          gia TEXT,
          ddd TEXT,
          siafi TEXT,
          updated_at INTEGER
          );''');
          await db.execute('CREATE INDEX IF NOT EXISTS idx_cep_cache_updated_at ON cep_cache(updated_at DESC);');
        },
        onUpgrade: (db, oldVersion, newVersion) async {},
      );
    }
    return AppDatabase._();
  }

  Database get database => _shared!;
}
