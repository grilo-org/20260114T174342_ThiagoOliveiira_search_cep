import 'env_config.dart';
import 'env_prod.dart';

enum AppFlavor { prod }

class AppEnvironment {
  static late AppFlavor flavor;
  static late EnvConfig config;

  static void init(String flavorStr) {
    flavor = AppFlavor.prod;

    switch (flavor) {
      case AppFlavor.prod:
        config = ProdConfig();
        break;
    }
  }

  static bool get isProd => flavor == AppFlavor.prod;
}
