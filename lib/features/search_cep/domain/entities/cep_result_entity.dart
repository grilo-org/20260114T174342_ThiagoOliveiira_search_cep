import 'package:search_cep/features/search_cep/search_cep.dart';

class CepResultEntity {
  final AddressEntity addressEntity;
  final bool fromCache;

  CepResultEntity({required this.addressEntity, required this.fromCache});
}
