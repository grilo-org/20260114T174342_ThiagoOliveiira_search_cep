import '../../../../core/core.dart';
import '../../../features.dart';

class AddressModel {
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? unidade;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? estado;
  final String? regiao;
  final String? ibge;
  final String? gia;
  final String? ddd;
  final String? siafi;

  const AddressModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      unidade: json['unidade'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      estado: json['estado'],
      regiao: json['regiao'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
    cep: map['cep'] ?? '',
    logradouro: map['logradouro'] ?? '',
    complemento: map['complemento'] ?? '',
    bairro: map['bairro'] ?? '',
    localidade: map['localidade'] ?? '',
    uf: map['uf'] ?? '',
    ibge: map['ibge'] ?? '',
    gia: map['gia'] ?? '',
    ddd: map['ddd'] ?? '',
    siafi: map['siafi'] ?? '',
    unidade: map['unidade'] ?? '',
    estado: map['estado'] ?? '',
    regiao: map['regiao'] ?? '',
  );

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      cep: entity.cep,
      logradouro: entity.logradouro,
      complemento: entity.complemento,
      bairro: entity.bairro,
      localidade: entity.localidade,
      uf: entity.uf,
      ibge: entity.ibge,
      gia: entity.gia,
      ddd: entity.ddd,
      siafi: entity.siafi,
      estado: entity.estado,
      regiao: entity.regiao,
      unidade: entity.unidade,
    );
  }

  Map<String, dynamic> toMap() => {
    'cep': CepFormatter.sanitize(cep ?? ''),
    'logradouro': logradouro,
    'complemento': complemento,
    'bairro': bairro,
    'localidade': localidade,
    'uf': uf,
    'ibge': ibge,
    'gia': gia,
    'ddd': ddd,
    'siafi': siafi,
    'unidade': unidade,
    'estado': estado,
    'regiao': regiao,
    'updated_at': DateTime.now().millisecondsSinceEpoch,
  };

  AddressEntity toEntity() => AddressEntity(
    cep: cep,
    logradouro: logradouro,
    complemento: complemento,
    unidade: unidade,
    bairro: bairro,
    localidade: localidade,
    uf: uf,
    estado: estado,
    regiao: regiao,
    ibge: ibge,
    gia: gia,
    ddd: ddd,
    siafi: siafi,
  );
}
