// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../dominio/auxiliares/dominio_erros.dart';
import '../../../../dominio/casos_uso/tarefas/adicionar_tarefa_repeticao_casouso.dart';
import '../../../../dominio/entidades/tarefas/tarefa_repeticao_entidade.dart';
import '../../../http/http.dart';
import '../../../models/remoto_node/tarefas/remoto_node_tarefa_repeticao_modelo.dart';

class RemotoNodeAdicionarTarefaRepeticaoCasoUso implements AdicionarTarefaRepeticaoCasoUso {
  final HttpCliente httpCliente;
  final String url;

  RemotoNodeAdicionarTarefaRepeticaoCasoUso({
    required this.httpCliente,
    required this.url,
  });

  @override
  Future<TarefaRepeticaoEntidade> adicionar(AdicionarTarefaRepeticaoRequisicao requisicao) async {
    final dadosRequisicao = RemotoNodeAdicionarTarefaRepeticaoRequisicao.fromDomain(requisicao).toJson();
    try {
      final httpResponse = await httpCliente.requisicao(url: url, metodo: 'post', corpo: dadosRequisicao);
      return RemotoNodeTarefaRepeticaoModelo.fromJson(httpResponse).toEntity();
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}

class RemotoNodeAdicionarTarefaRepeticaoRequisicao {
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  RemotoNodeAdicionarTarefaRepeticaoRequisicao({
    required this.tarefaId,
    required this.periodicidade,
    this.data,
    this.diaSemana,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tarefaId': tarefaId,
      'periodicidade': periodicidade,
      'data': data?.millisecondsSinceEpoch,
      'diaSemana': diaSemana,
    };
  }

  factory RemotoNodeAdicionarTarefaRepeticaoRequisicao.fromDomain(AdicionarTarefaRepeticaoRequisicao tarefaRepeticao) =>
      RemotoNodeAdicionarTarefaRepeticaoRequisicao(
          tarefaId: tarefaRepeticao.tarefaId,
          periodicidade: tarefaRepeticao.periodicidade,
          data: tarefaRepeticao.data,
          diaSemana: tarefaRepeticao.diaSemana);

  factory RemotoNodeAdicionarTarefaRepeticaoRequisicao.fromMap(Map<String, dynamic> map) {
    return RemotoNodeAdicionarTarefaRepeticaoRequisicao(
      tarefaId: map['tarefaId'] as String,
      periodicidade: map['periodicidade'] as String,
      data: map['data'] != null ? DateTime.fromMillisecondsSinceEpoch(map['data'] as int) : null,
      diaSemana: map['diaSemana'] != null ? map['diaSemana'] as String : null,
    );
  }

  factory RemotoNodeAdicionarTarefaRepeticaoRequisicao.fromJson(String source) =>
      RemotoNodeAdicionarTarefaRepeticaoRequisicao.fromMap(json.decode(source) as Map<String, dynamic>);
}
