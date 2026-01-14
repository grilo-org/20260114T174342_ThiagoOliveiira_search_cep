import 'package:search_cep/features/theme/data/datasource/theme_local_datasource.dart';
import 'package:search_cep/features/theme/domain/entity/theme_entity.dart';
import 'package:search_cep/features/theme/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource datasource;

  ThemeRepositoryImpl({required this.datasource});

  @override
  Future<ThemeEntity> getTheme() async {
    return await datasource.getTheme();
  }

  @override
  Future<void> saveTheme(ThemeEntity theme) async {
    await datasource.saveTheme(theme);
  }
}
