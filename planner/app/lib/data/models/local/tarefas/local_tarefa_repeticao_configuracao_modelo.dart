import 'package:app/domain/entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

class LocalTarefaRepeticaoConfiguracaoModelo {

  LocalTarefaRepeticaoConfiguracaoModelo(
      {required this.id, required this.tarefaId, required this.periodicidade, this.periodicidadeSemanal, this.periodo});

  factory LocalTarefaRepeticaoConfiguracaoModelo.fromEntity(TarefaRepeticaoConfiguracaoEntidade tarefaRepeticaoConfiguracao) =>
      LocalTarefaRepeticaoConfiguracaoModelo(
        id: tarefaRepeticaoConfiguracao.id,
        tarefaId: tarefaRepeticaoConfiguracao.tarefaId,
        periodicidade: tarefaRepeticaoConfiguracao.periodicidade,
        periodicidadeSemanal: tarefaRepeticaoConfiguracao.periodicidadeSemanal,
        periodo: tarefaRepeticaoConfiguracao.periodo,
      );
  factory LocalTarefaRepeticaoConfiguracaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'tarefaId', 'periodicidade'])) {
      throw Exception();
    }
    return LocalTarefaRepeticaoConfiguracaoModelo(
        id: json['id'].toString(),
        tarefaId: json['tarefaId'].toString(),
        periodicidade: json['periodicidade'].toString(),
        periodicidadeSemanal: ['periodicidadeSemanal'],
        periodo: int.parse(['periodo'].toString()));
  }
  final String id;
  final String tarefaId;
  final String periodicidade;
  final List<String>? periodicidadeSemanal;
  final int? periodo;

  Map toJson() => {
        'id': id,
        'tarefaId': tarefaId,
        'periodicidade': periodicidade,
        'periodicidadeSemanal': periodicidadeSemanal,
        'periodo': periodo,
      };
  TarefaRepeticaoConfiguracaoEntidade toEntity() => TarefaRepeticaoConfiguracaoEntidade(
        id: id,
        tarefaId: tarefaId,
        periodicidade: periodicidade,
        periodicidadeSemanal: periodicidadeSemanal,
        periodo: periodo,
      );
}
