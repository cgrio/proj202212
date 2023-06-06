import 'package:app/domain/entidades/usuarios/usuarios_entidade.dart';
import 'package:equatable/equatable.dart';

abstract class AdicionarUsuarioCasoUso {
  Future<UsuarioEntidade> adicionar(AdicionarUsuarioRequisicao requisicao);
}

class AdicionarUsuarioRequisicao extends Equatable {
  final String nome;
  final String login;
  final String email;
  final String senha;
  final String senhaConfirmacao;

  const AdicionarUsuarioRequisicao(
      {required this.nome, required this.login, required this.email, required this.senha, required this.senhaConfirmacao});

  @override
  List<Object?> get props => ['nome', 'login', 'email', 'senha', 'senhaConfirmacao'];
}
