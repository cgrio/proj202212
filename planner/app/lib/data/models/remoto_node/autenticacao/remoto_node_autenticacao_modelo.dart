import 'package:app/domain/entidades/autenticacao/autenticacao_entidade.dart';

class RemotoNodeAutenticacaoModelo {
  final String token;

  RemotoNodeAutenticacaoModelo(this.token);

  factory RemotoNodeAutenticacaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().contains('token')) {
      throw Exception();
    }
    return RemotoNodeAutenticacaoModelo(json['token'].toString());
  }

  factory RemotoNodeAutenticacaoModelo.fromEntity(AutenticacaoEntidade entidade) => RemotoNodeAutenticacaoModelo(entidade.token);

  Map<String, dynamic> toJson() => {'token': token};

  AutenticacaoEntidade toEntity() => AutenticacaoEntidade(token);
}
