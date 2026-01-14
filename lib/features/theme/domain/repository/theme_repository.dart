import 'package:search_cep/features/theme/domain/entity/theme_entity.dart';

abstract class ThemeRepository {
  Future<ThemeEntity> getTheme();
  Future<void> saveTheme(ThemeEntity theme);
}
