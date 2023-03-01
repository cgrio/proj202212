import 'package:app/dominio/entidades/lembretes/lembrete_entidade.dart';

import '../../../../dominio/auxiliares/dominio_erros.dart';
import '../../../../dominio/casos_uso/lembretes/adicionar_lembrete_casouso.dart';
import '../../../http/http.dart';
import '../../../models/remoto_node/lembrete/remoto_node_lembrete_modelo.dart';

class RemotoNodeAdicionarLembreteCasoUso implements AdicionarLembreteCasoUso {
  final HttpCliente httpCliente;
  final String url;

  RemotoNodeAdicionarLembreteCasoUso({required this.httpCliente, required this.url});

  @override
  Future<LembreteEntidade> adicionar(AdicionarLembreteRequisicao requisicao) async {
    final dadosRequisicao = RemotoNodeAdicionarLembreRequisicao.fromDomain(requisicao).toJson();
    try {
      return RemotoNodeLembreteModelo.fromJson(await httpCliente.requisicao(url: url, metodo: 'post', corpo: dadosRequisicao)).toEntity();
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}

class RemotoNodeAdicionarLembreRequisicao {
  final String nome;
  final DateTime? dataConclusao;
  final String usuarioId;
  final String cor;

  RemotoNodeAdicionarLembreRequisicao({
    required this.nome,
    this.dataConclusao,
    required this.usuarioId,
    required this.cor,
  });

  factory RemotoNodeAdicionarLembreRequisicao.fromDomain(AdicionarLembreteRequisicao lembrete) => RemotoNodeAdicionarLembreRequisicao(
      nome: lembrete.nome, dataConclusao: lembrete.dataConclusao, usuarioId: lembrete.usuarioId, cor: lembrete.cor ?? '');

  Map toJson() => {'nome': nome, 'dataConclusao': dataConclusao, 'usuarioId': usuarioId, 'cor': cor};
}
