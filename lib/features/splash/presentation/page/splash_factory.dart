import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep/features/features.dart';

Widget makeSplashPage() => BlocProvider(create: (context) => makeSplashCubit()..init(), child: SplashPage());

SplashCubit makeSplashCubit() => SplashCubit();
