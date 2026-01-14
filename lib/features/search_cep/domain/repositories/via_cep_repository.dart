import '../../../features.dart';

abstract class ViaCepRepository {
  Future<CepResultEntity?> searchAddressByCep(int cep);
}
