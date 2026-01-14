import '../domain.dart';

class GetAddressByCepUsecase {
  final ViaCepRepository repo;

  GetAddressByCepUsecase({required this.repo});

  Future<CepResultEntity?> call(int cep) async {
    return repo.searchAddressByCep(cep);
  }
}
