// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: type=lint
// ignore_for_file: type=flutter-lint
import 'package:app/data/http/http.dart';
import 'package:app/domain/casos_uso/autenticacao/login_casouso.dart';
import 'package:app/domain/casos_uso/autenticacao/salvar_conta_casouso.dart';

import '../../../../domain/auxiliares/dominio_erros.dart';

import '../../../../domain/casos_uso/usuarios/adicionar_usuario_casouso.dart';
import '../../../../domain/entidades/autenticacao/autenticacao_entidade.dart';
import '../../../models/remoto_node/autenticacao/remoto_node_autenticacao_modelo.dart';

class RemotoNodeSalvarContaCasoUso implements SalvarContaCasoUso {
  RemotoNodeSalvarContaCasoUso({required this.httpCliente, required this.url});
  final HttpCliente httpCliente;
  final String url;

  @override
  Future<AutenticacaoEntidade> salvar(AutenticacaoRequisicao requisicao) async {
    final dadosRequisicao = RemotoNodeSalvarContaRequisicao.fromDomain(requisicao).toJson();
    try {
      final httpResponse = await httpCliente.requisicao(url: url, metodo: 'post', corpo: dadosRequisicao);
      return RemotoNodeAutenticacaoModelo.fromJson(httpResponse).toEntity();
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}

class RemotoNodeSalvarContaRequisicao {
  final String nome;
  final String email;
  final String senha;
  final String senhaConfirmacao;
  RemotoNodeSalvarContaRequisicao({required this.nome, required this.email, required this.senha, required this.senhaConfirmacao});

  factory RemotoNodeSalvarContaRequisicao.fromDomain(AdicionarUsuarioRequisicao parametros) => RemotoNodeSalvarContaRequisicao(
      nome: parametros.nome, email: parametros.email, senha: parametros.senha, senhaConfirmacao: parametros.senhaConfirmacao);

  Map toJson() => {
        'nome': nome,
        'email': email,
        'senha': senha,
        'senhaConfirmacao': senhaConfirmacao,
      };
}
