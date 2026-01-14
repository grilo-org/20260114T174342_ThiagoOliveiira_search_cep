part of 'search_cep_cubit.dart';

enum SearchCepStatus { initial, loading, success, error }

class SearchCepState extends Equatable {
  final SearchCepStatus? status;
  final CepResultEntity? addressEntity;
  final String? navigateTo;
  final AppError? error;

  const SearchCepState({this.status = SearchCepStatus.initial, this.addressEntity, this.navigateTo, this.error});

  @override
  List get props => [status, addressEntity, navigateTo, error];

  SearchCepState copyWith({SearchCepStatus? status, CepResultEntity? addressEntity, String? navigateTo, ValueGetter<AppError?>? error}) {
    return SearchCepState(status: status ?? this.status, addressEntity: addressEntity ?? this.addressEntity, navigateTo: navigateTo ?? this.navigateTo, error: error != null ? error() : this.error);
  }
}
