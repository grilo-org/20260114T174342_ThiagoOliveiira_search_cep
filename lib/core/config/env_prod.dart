import '../core.dart';

class ProdConfig implements EnvConfig {
  @override
  String get baseUrl => 'https://viacep.com.br';

  @override
  String get appName => 'SearchCEP';
}
