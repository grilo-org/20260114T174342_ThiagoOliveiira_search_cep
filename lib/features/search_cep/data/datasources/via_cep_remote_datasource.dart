import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class ViaCepRemoteDatasource {
  Future<AddressEntity?> searchAddressByCep(int cep);
}

class ViaCepRemoteDatasourceImpl implements ViaCepRemoteDatasource {
  final ApiClient client;

  ViaCepRemoteDatasourceImpl({required this.client});

  @override
  Future<AddressEntity> searchAddressByCep(int cep) async {
    final response = await client.get('/ws/$cep/json');

    if (response['erro'] == "true" || response['erro'] == true) {
      throw const AppError(AppErrorType.notFound);
    }
    return AddressModel.fromJson(response).toEntity();
  }
}
