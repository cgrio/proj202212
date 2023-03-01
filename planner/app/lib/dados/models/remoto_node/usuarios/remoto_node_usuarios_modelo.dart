import 'package:app/dominio/entidades/usuarios/usuarios_entidade.dart';

class RemotoNodeUsuarioModelo {
  RemotoNodeUsuarioModelo({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });
  factory RemotoNodeUsuarioModelo.fromEntity(UsuarioEntidade usuario) =>
      RemotoNodeUsuarioModelo(id: usuario.id, nome: usuario.nome, email: usuario.email, senha: usuario.senha);

  factory RemotoNodeUsuarioModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'email', 'senha'])) {
      throw Exception();
    }
    return RemotoNodeUsuarioModelo(
        id: json['id'].toString(), nome: json['nome'].toString(), email: json['email'].toString(), senha: json['senha'].toString());
  }
  final String id;
  final String nome;
  final String email;
  final String senha;

  Map toJson() => {'id': id, 'nome': nome, 'email': email, 'senha': senha};

  UsuarioEntidade toEntity() => UsuarioEntidade(id: id, nome: nome, email: email, senha: senha);
}
