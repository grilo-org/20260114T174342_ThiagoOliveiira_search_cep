part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, success, error }

class ThemeState extends Equatable {
  final ThemeStatus status;
  final ThemeEntity? themeEntity;

  const ThemeState({required this.status, this.themeEntity});

  const ThemeState.initial() : status = ThemeStatus.initial, themeEntity = null;

  @override
  List get props => [status, themeEntity];

  ThemeState copyWith({ThemeStatus? status, ThemeEntity? themeEntity}) {
    return ThemeState(status: status ?? this.status, themeEntity: themeEntity ?? this.themeEntity);
  }
}
