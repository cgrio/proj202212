import 'package:app/dominio/entidades/usuarios/usuarios_entidade.dart';

class LocalUsuarioModelo {
  final String id;
  final String nome;
  final String email;
  final String senha;

  LocalUsuarioModelo({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory LocalUsuarioModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'email', 'senha'])) {
      throw Exception();
    }
    return LocalUsuarioModelo(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        senha: json['senha']);
  }
  factory LocalUsuarioModelo.fromEntity(UsuarioEntidade usuario) =>
      LocalUsuarioModelo(
          id: usuario.id,
          nome: usuario.nome,
          email: usuario.email,
          senha: usuario.senha);

  Map toJson() => {'id': id, 'nome': nome, 'email': email, 'senha': senha};

  UsuarioEntidade toEntity() =>
      UsuarioEntidade(id: id, nome: nome, email: email, senha: senha);
}
