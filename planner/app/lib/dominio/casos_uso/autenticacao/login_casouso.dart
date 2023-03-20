import 'package:equatable/equatable.dart';

import '../../entidades/autenticacao/autenticacao_entidade.dart';

abstract class LoginCasoUso {
  Future<AutenticacaoEntidade> login(AutenticacaoRequisicao requisicao);
}

class AutenticacaoRequisicao extends Equatable {
  final String login;
  final String senha;

  const AutenticacaoRequisicao({required this.login, required this.senha});

  @override
  List<Object?> get props => ['login', 'senha'];
}
