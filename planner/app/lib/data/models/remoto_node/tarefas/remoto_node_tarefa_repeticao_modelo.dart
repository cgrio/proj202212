import 'package:app/domain/entidades/tarefas/tarefa_repeticao_entidade.dart';

import '../../../http/http.dart';

class RemotoNodeTarefaRepeticaoModelo {
  RemotoNodeTarefaRepeticaoModelo({required this.id, required this.tarefaId, required this.periodicidade, this.data, this.diaSemana});
  factory RemotoNodeTarefaRepeticaoModelo.fromEntity(TarefaRepeticaoEntidade tarefaRepeticao) => RemotoNodeTarefaRepeticaoModelo(
      id: tarefaRepeticao.id,
      tarefaId: tarefaRepeticao.tarefaId,
      periodicidade: tarefaRepeticao.periodicidade,
      data: tarefaRepeticao.data,
      diaSemana: tarefaRepeticao.diaSemana);

  factory RemotoNodeTarefaRepeticaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'tarefaId', 'periodicidade'])) {
      throw HttpErros.dadosInvalidos;
    }
    return RemotoNodeTarefaRepeticaoModelo(
      id: json['id'].toString(),
      tarefaId: json['tarefaId'].toString(),
      periodicidade: json['periodicidade'].toString(),
      data: DateTime.parse(['data'].toString()),
      diaSemana: json['diaSemana'].toString(),
    );
  }
  final String id;
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  Map toJson() => {'id': id, 'tarefaId': tarefaId, 'periodicidade': periodicidade, 'data': data, 'diaSemana': diaSemana};

  TarefaRepeticaoEntidade toEntity() =>
      TarefaRepeticaoEntidade(id: id, tarefaId: tarefaId, periodicidade: periodicidade, data: data, diaSemana: diaSemana);
}
