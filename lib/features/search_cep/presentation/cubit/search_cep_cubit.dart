import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:search_cep/features/search_cep/search_cep.dart';

import '../../../../core/core.dart';

part 'search_cep_state.dart';

class SearchCepCubit extends Cubit<SearchCepState> {
  final GetAddressByCepUsecase getAddressByCepUsecase;
  SearchCepCubit({required this.getAddressByCepUsecase}) : super(SearchCepState());

  final cepForm = buildCEPForm();

  Future<void> searchCEP() async {
    try {
      emit(state.copyWith(status: SearchCepStatus.loading));

      String cep = cepForm.control('cep').value;

      final result = await getAddressByCepUsecase.call(int.parse(cep.replaceAll('-', '')));

      emit(state.copyWith(status: SearchCepStatus.success, addressEntity: result, navigateTo: ResultCepPage.routeName));
    } catch (e) {
      final err = mapToAppError(e);
      emit(state.copyWith(status: SearchCepStatus.error, error: () => err));
    }
  }
}
