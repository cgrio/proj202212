// ignore_for_file: type=lint
// ignore_for_file: type=flutter-lint
import 'package:app/dados/http/http.dart';

import '../../../models/remoto_node/autenticacao/remoto_node_autenticacao_modelo.dart';
import '../../../../dominio/auxiliares/dominio_erros.dart';
import '../../../../dominio/casos_uso/autenticacao/login_casouso.dart';
import '../../../../dominio/entidades/autenticacao/autenticacao_entidade.dart';

class RemotoNodeLoginCasoUso implements LoginCasoUso {
  RemotoNodeLoginCasoUso({required this.httpCliente, required this.url});
  final HttpCliente httpCliente;
  final String url;

  @override
  Future<AutenticacaoEntidade> login(AutenticacaoRequisicao requisicao) async {
    final dadosRequisicao = RemotoNodeLoginRequisicao.fromDomain(requisicao).toJson();
    try {
      final httpResponse = await httpCliente.requisicao(url: url, metodo: 'post', corpo: dadosRequisicao);
      return RemotoNodeAutenticacaoModelo.fromJson(httpResponse).toEntity();
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}

class RemotoNodeLoginRequisicao {
  factory RemotoNodeLoginRequisicao.fromDomain(AutenticacaoRequisicao autenticacao) =>
      RemotoNodeLoginRequisicao(login: autenticacao.login, senha: autenticacao.senha);

  RemotoNodeLoginRequisicao({required this.login, required this.senha});
  final String login;
  final String senha;

  Map toJson() => {'login': login, 'senha': senha};
}
