import 'package:app/dominio/entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

import '../../../http/http_erros.dart';

class RemotoNodeTarefaRepeticaoConfiguracaoModelo {
  RemotoNodeTarefaRepeticaoConfiguracaoModelo(
      {required this.id, required this.tarefaId, required this.periodicidade, this.periodicidadeSemanal, this.periodo});

  factory RemotoNodeTarefaRepeticaoConfiguracaoModelo.fromEntity(TarefaRepeticaoConfiguracaoEntidade tarefaRepeticaoConfiguracao) =>
      RemotoNodeTarefaRepeticaoConfiguracaoModelo(
        id: tarefaRepeticaoConfiguracao.id,
        tarefaId: tarefaRepeticaoConfiguracao.tarefaId,
        periodicidade: tarefaRepeticaoConfiguracao.periodicidade,
        periodicidadeSemanal: tarefaRepeticaoConfiguracao.periodicidadeSemanal,
        periodo: tarefaRepeticaoConfiguracao.periodo,
      );
  factory RemotoNodeTarefaRepeticaoConfiguracaoModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'tarefaId', 'periodicidade'])) {
      throw HttpErros.dadosInvalidos;
    }
    return RemotoNodeTarefaRepeticaoConfiguracaoModelo(
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
