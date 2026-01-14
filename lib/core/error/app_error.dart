enum AppErrorType { notFound, network, timeout, server, rateLimit, parsing, cache, unknown }

class AppError implements Exception {
  final AppErrorType type;
  final String? message;
  const AppError(this.type, {this.message});

  String get userMessage {
    return switch (type) {
      AppErrorType.notFound => message ?? 'Não encontramos esse CEP',
      AppErrorType.network => message ?? 'Sem conexão. Verifique sua internet.',
      AppErrorType.timeout => message ?? 'Tempo de resposta esgotado.',
      AppErrorType.rateLimit => message ?? 'Muitas consultas. Tente novamente em instantes.',
      AppErrorType.server => message ?? 'Erro no servidor.',
      AppErrorType.parsing => message ?? 'Não foi possível interpretar a resposta.',
      AppErrorType.cache => message ?? 'Falha ao acessar o histórico.',
      AppErrorType.unknown => message ?? 'Ocorreu um erro inesperado.',
    };
  }
}
