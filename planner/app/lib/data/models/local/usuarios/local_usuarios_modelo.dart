import 'package:app/domain/entidades/usuarios/usuarios_entidade.dart';

class LocalUsuarioModelo {
  LocalUsuarioModelo({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });
  factory LocalUsuarioModelo.fromEntity(UsuarioEntidade usuario) =>
      LocalUsuarioModelo(id: usuario.id, nome: usuario.nome, email: usuario.email, senha: usuario.senha);

  factory LocalUsuarioModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'email', 'senha'])) {
      throw Exception();
    }
    return LocalUsuarioModelo(
        id: json['id'].toString(), nome: json['nome'].toString(), email: json['email'].toString(), senha: json['senha'].toString());
  }
  final String id;
  final String nome;
  final String email;
  final String senha;

  Map toJson() => {'id': id, 'nome': nome, 'email': email, 'senha': senha};

  UsuarioEntidade toEntity() => UsuarioEntidade(id: id, nome: nome, email: email, senha: senha);
}
