import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import './core/core.dart';
import './features/features.dart';
import 'ds/ds.dart';

void main() async {
  AppEnvironment.init('prod');
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(BlocProvider(create: (context) => getIt<ThemeCubit>()..getTheme(), child: const SearchCepApp()));
}

class SearchCepApp extends StatefulWidget {
  const SearchCepApp({super.key});

  @override
  State<SearchCepApp> createState() => _SearchCepAppState();
}

class _SearchCepAppState extends State<SearchCepApp> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = AppRouter.routes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(title: 'Search CEP', debugShowCheckedModeBanner: false, theme: state.themeEntity?.themeType == ThemeType.light ? buildLightTheme() : buildDarkTheme(), routerConfig: _router);
      },
    );
  }
}
