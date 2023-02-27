import 'package:app/dominio/entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

class LocalTarefaRepeticaoConfiguracaoModelo {
  final String id;
  final String tarefaId;
  final String periodicidade;
  final List<String>? periodicidadeSemanal;
  final int? periodo;

  LocalTarefaRepeticaoConfiguracaoModelo(
      {required this.id,
      required this.tarefaId,
      required this.periodicidade,
      this.periodicidadeSemanal,
      this.periodo});
  factory LocalTarefaRepeticaoConfiguracaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'tarefaId', 'periodicidade'])) {
      throw Exception();
    }
    return LocalTarefaRepeticaoConfiguracaoModelo(
        id: json['id'],
        tarefaId: json['tarefaId'],
        periodicidade: json['periodicidade'],
        periodicidadeSemanal: json['periodicidadeSemanal'],
        periodo: json['periodo']);
  }

  factory LocalTarefaRepeticaoConfiguracaoModelo.fromEntity(
          TarefaRepeticaoConfiguracaoEntidade tarefaRepeticaoConfiguracao) =>
      LocalTarefaRepeticaoConfiguracaoModelo(
        id: tarefaRepeticaoConfiguracao.id,
        tarefaId: tarefaRepeticaoConfiguracao.tarefaId,
        periodicidade: tarefaRepeticaoConfiguracao.periodicidade,
        periodicidadeSemanal: tarefaRepeticaoConfiguracao.periodicidadeSemanal,
        periodo: tarefaRepeticaoConfiguracao.periodo,
      );

  Map toJson() => {
        'id': id,
        'tarefaId': tarefaId,
        'periodicidade': periodicidade,
        'periodicidadeSemanal': periodicidadeSemanal,
        'periodo': periodo,
      };
  TarefaRepeticaoConfiguracaoEntidade toEntity() =>
      TarefaRepeticaoConfiguracaoEntidade(
        id: id,
        tarefaId: tarefaId,
        periodicidade: periodicidade,
        periodicidadeSemanal: periodicidadeSemanal,
        periodo: periodo,
      );
}
