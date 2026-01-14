# 📍 Search CEP App

Aplicativo Flutter para consulta de endereços via **API ViaCEP**, com **cache local em SQLite (Sqflite)** para otimizar buscas já realizadas.

### 🔹 Screenshot

<p align="left">
   <img src = "assets/screenshot/search_app.png" alt="SearchApp" width = "700" />
</p>


## 🚀 Funcionalidades

- Busca endereços pelo CEP utilizando a API pública [ViaCEP](https://viacep.com.br/).
- Armazena localmente as consultas no **Sqflite**.
- Caso um CEP já tenha sido consultado anteriormente, o app retorna os dados diretamente do **cache local**, evitando chamadas desnecessárias à API.
- Estrutura organizada em **Clean Architecture** (Data / Domain / Presentation).
- Gerenciamento de estado com **Cubit (Bloc)**.

## 🏗️ Arquitetura

```
lib/
 ├── core/             # Configurações, Database, Network e utilitários
 ├── ds/               # Design System (temas, tokens, componentes)
 ├── features/
 │    └── search_cep/  # Módulo principal de consulta de CEP
 │        ├── data/        # Datasources (API / Local) + Repository Impl
 │        ├── domain/      # Entidades, Repositórios (contratos), Usecases
 │        ├── factories/ # Injeção de dependências
 │        ├── presentation/ # Cubits e Páginas
 └── main.dart
```

### Fluxo de Consulta
1. **Cubit** chama o `GetAddressByCepUsecase`.
2. O Usecase aciona o `ViaCepRepository`.
3. O Repositório:
   - Tenta recuperar do **SQLite (CepLocalDatasource)**.
   - Se não encontrado, consulta a **API ViaCEP (ViaCepRemoteDatasource)**.
   - Salva o resultado no cache e retorna.
4. A UI exibe o resultado.

## 📦 Dependências principais

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) – Gerenciamento de estado  
- [equatable](https://pub.dev/packages/equatable) – Comparação de estados/entidades  
- [sqflite](https://pub.dev/packages/sqflite) – Banco de dados local  
- [path_provider](https://pub.dev/packages/path_provider) – Diretórios locais  
- [dio](https://pub.dev/packages/dio) – Requisições à API  

## ▶️ Execução


Utilizar a versão 3.29.0 do Flutter

```bash
flutter pub get
flutter run
```
