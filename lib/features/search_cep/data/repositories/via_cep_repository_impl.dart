import '../../domain/domain.dart';
import '../data.dart';

class ViaCepRepositoryImpl implements ViaCepRepository {
  final ViaCepRemoteDatasource remote;
  final CepLocalDatasource local;

  ViaCepRepositoryImpl({required this.remote, required this.local});

  @override
  Future<CepResultEntity?> searchAddressByCep(int cep) async {
    final cache = await local.getCep(cep.toString());
    if (cache != null) {
      return CepResultEntity(addressEntity: cache, fromCache: true);
    }

    final resultRemote = await remote.searchAddressByCep(cep);
    if (resultRemote == null) return null;

    await local.cacheCep(resultRemote);
    return CepResultEntity(addressEntity: resultRemote, fromCache: false);
  }
}
