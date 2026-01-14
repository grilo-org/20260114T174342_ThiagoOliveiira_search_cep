part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final String? navigateTo;

  const SplashState({this.navigateTo});

  @override
  List get props => [navigateTo];

  SplashState copyWith({String? navigateTo}) {
    return SplashState(navigateTo: navigateTo ?? this.navigateTo);
  }
}
