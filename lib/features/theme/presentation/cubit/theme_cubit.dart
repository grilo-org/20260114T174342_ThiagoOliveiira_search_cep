import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../features.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetThemeUsecase getThemeUsecase;
  final SaveThemeUsecase saveThemeUsecase;

  ThemeCubit({required this.getThemeUsecase, required this.saveThemeUsecase}) : super(ThemeState.initial());

  Future<void> getTheme() async {
    emit(state.copyWith(status: ThemeStatus.loading));
    try {
      var result = await getThemeUsecase();
      emit(state.copyWith(status: ThemeStatus.success, themeEntity: result));
    } catch (e) {
      if (kDebugMode) {
        print('Error ao carregar theme');
      }
    }
  }

  Future<void> onToggleTheme() async {
    if (state.themeEntity != null) {
      var newThemeType = state.themeEntity!.themeType == ThemeType.dark ? ThemeType.light : ThemeType.dark;
      var newThemeEntity = ThemeEntity(themeType: newThemeType);

      try {
        await saveThemeUsecase(newThemeEntity);
        emit(state.copyWith(status: ThemeStatus.success, themeEntity: newThemeEntity));
      } catch (e) {
        if (kDebugMode) {
          print('Erro ao mudar o tema');
        }
      }
    }
  }
}
