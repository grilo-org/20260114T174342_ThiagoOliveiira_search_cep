import 'package:get_it/get_it.dart';
import 'package:search_cep/features/theme/data/datasource/theme_local_datasource.dart';
import 'package:search_cep/features/theme/data/repository/theme_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/features.dart';
import '../core.dart';

var getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());

  getIt.registerSingleton(ThemeLocalDatasource(sharedPreferences: getIt()));

  getIt.registerSingleton<ThemeRepository>(ThemeRepositoryImpl(datasource: getIt()));

  getIt.registerSingleton(GetThemeUsecase(themeRepository: getIt()));
  getIt.registerSingleton(SaveThemeUsecase(themeRepository: getIt()));

  getIt.registerFactory(() => ThemeCubit(getThemeUsecase: getIt(), saveThemeUsecase: getIt()));

  final db = await AppDatabase.getInstance();
  getIt.registerLazySingleton<AppDatabase>(() => db);

  getIt.registerLazySingleton<CepLocalDatasource>(() => CepLocalDatasourceImpl(db: getIt<AppDatabase>()));
}
