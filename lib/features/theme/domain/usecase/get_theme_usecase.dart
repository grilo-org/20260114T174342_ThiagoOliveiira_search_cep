import 'package:search_cep/features/theme/domain/entity/theme_entity.dart';
import 'package:search_cep/features/theme/domain/repository/theme_repository.dart';

class GetThemeUsecase {
  final ThemeRepository themeRepository;

  GetThemeUsecase({required this.themeRepository});

  Future<ThemeEntity> call() async {
    return themeRepository.getTheme();
  }
}
