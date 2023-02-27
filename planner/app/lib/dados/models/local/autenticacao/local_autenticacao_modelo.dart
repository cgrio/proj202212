import 'package:app/dominio/entidades/autenticacao/autenticacao_entidade.dart';

class LocalAutenticacaoModelo {
  final String token;

  LocalAutenticacaoModelo(this.token);

  factory LocalAutenticacaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().contains('token')) {
      throw Exception();
    }
    return LocalAutenticacaoModelo(json['token']);
  }

  factory LocalAutenticacaoModelo.fromEntity(AutenticacaoEntidade entidade) =>
      LocalAutenticacaoModelo(entidade.token);

  Map toJson() => {'token': token};

  AutenticacaoEntidade toEntity() => AutenticacaoEntidade(token);
}
