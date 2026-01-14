import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../features.dart';

Widget makeHomePage() => BlocProvider(create: (_) => makeHomeCubit(), child: SearchCepPage());

SearchCepCubit makeHomeCubit() => SearchCepCubit(getAddressByCepUsecase: makeGetAddressByCepUsecase());

GetAddressByCepUsecase makeGetAddressByCepUsecase() => GetAddressByCepUsecase(repo: makeViaCepRepository());

ViaCepRepository makeViaCepRepository() => ViaCepRepositoryImpl(remote: makeViaCepRemoteDatasource(), local: getIt());

ViaCepRemoteDatasource makeViaCepRemoteDatasource() => ViaCepRemoteDatasourceImpl(client: makeApiClient());

ApiClient makeApiClient() => ApiClient();
