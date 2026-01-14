import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

import '../core.dart';

AppError mapToAppError(Object e) {
  if (e is AppError) return e;
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppError(AppErrorType.timeout);
      case DioExceptionType.connectionError:
        return const AppError(AppErrorType.network);
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode ?? 0;
        if (code == 404) return const AppError(AppErrorType.notFound);
        if (code == 429) return const AppError(AppErrorType.rateLimit);
        if (code >= 500) return const AppError(AppErrorType.server);
        return const AppError(AppErrorType.server);
      case DioExceptionType.badCertificate:
        return const AppError(AppErrorType.server, message: 'Certificado inválido.');
      case DioExceptionType.cancel:
        return const AppError(AppErrorType.network, message: 'Requisição cancelada.');
      case DioExceptionType.unknown:
        return const AppError(AppErrorType.network);
    }
  }

  if (e is SocketException) return const AppError(AppErrorType.network);
  if (e is TimeoutException) return const AppError(AppErrorType.timeout);
  if (e is FormatException) return const AppError(AppErrorType.parsing);

  if (e is DatabaseException) return const AppError(AppErrorType.cache);

  return AppError(AppErrorType.unknown, message: e.toString());
}
