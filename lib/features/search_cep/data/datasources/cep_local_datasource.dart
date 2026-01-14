import 'package:sqflite/sqflite.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class CepLocalDatasource {
  Future<AddressEntity?> getCep(String cep);
  Future<void> cacheCep(AddressEntity model);
}

class CepLocalDatasourceImpl implements CepLocalDatasource {
  final AppDatabase db;

  CepLocalDatasourceImpl({required this.db});

  Database get _db => db.database;
  static const _table = 'cep_cache';

  @override
  Future<AddressEntity?> getCep(String cep) async {
    final res = await _db.query(_table, where: 'cep = ?', whereArgs: [cep], limit: 1);
    if (res.isEmpty) return null;
    return AddressModel.fromMap(res.first).toEntity();
  }

  @override
  Future<void> cacheCep(AddressEntity entity) async {
    AddressModel model = AddressModel.fromEntity(entity);
    await _db.insert(_table, model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
