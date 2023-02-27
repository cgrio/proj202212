import 'package:app/dominio/entidades/tarefas/tarefa_repeticao_entidade.dart';

class LocalTarefaRepeticaoModelo {
  final String id;
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  LocalTarefaRepeticaoModelo(
      {required this.id,
      required this.tarefaId,
      required this.periodicidade,
      this.data,
      this.diaSemana});

  factory LocalTarefaRepeticaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'tarefaId', 'periodicidade'])) {
      throw Exception();
    }
    return LocalTarefaRepeticaoModelo(
      id: json["id"],
      tarefaId: json["tarefaId"],
      periodicidade: json["periodicidade"],
      data: json["data"],
      diaSemana: json["diaSemana"],
    );
  }

  factory LocalTarefaRepeticaoModelo.fromEntity(
          TarefaRepeticaoEntidade tarefaRepeticao) =>
      LocalTarefaRepeticaoModelo(
          id: tarefaRepeticao.id,
          tarefaId: tarefaRepeticao.tarefaId,
          periodicidade: tarefaRepeticao.periodicidade,
          data: tarefaRepeticao.data,
          diaSemana: tarefaRepeticao.diaSemana);

  Map toJson() => {
        'id': id,
        'tarefaId': tarefaId,
        'periodicidade': periodicidade,
        'data': data,
        'diaSemana': diaSemana
      };

  TarefaRepeticaoEntidade toEntity() => TarefaRepeticaoEntidade(
      id: id,
      tarefaId: tarefaId,
      periodicidade: periodicidade,
      data: data,
      diaSemana: diaSemana);
}
