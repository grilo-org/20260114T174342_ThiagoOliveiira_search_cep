import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../features.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());

  Future<void> init() async {
    await Future.delayed(Duration(milliseconds: 1500));

    emit(state.copyWith(navigateTo: SearchCepPage.routeName));
  }
}
