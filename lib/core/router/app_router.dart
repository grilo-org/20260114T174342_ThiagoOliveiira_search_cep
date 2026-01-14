import 'package:go_router/go_router.dart';
import 'package:search_cep/features/features.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => makeSplashPage()),
        GoRoute(path: '/searchCep', name: SearchCepPage.routeName, builder: (context, state) => makeHomePage()),
        GoRoute(
          path: '/resultCep',
          name: ResultCepPage.routeName,
          builder: (context, state) {
            final address = state.extra;
            if (address is! CepResultEntity) return const ResultCepPage(cepResultEntity: null);
            return ResultCepPage(cepResultEntity: address);
          },
        ),
      ],
    );
  }
}
