import 'package:search_cep/features/theme/domain/entity/theme_entity.dart';
import 'package:search_cep/features/theme/domain/repository/theme_repository.dart';

class SaveThemeUsecase {
  final ThemeRepository themeRepository;

  SaveThemeUsecase({required this.themeRepository});

  Future<void> call(ThemeEntity theme) async {
    await themeRepository.saveTheme(theme);
  }
}
