import 'package:equatable/equatable.dart';

import '../../entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

abstract class AdicionarTarefaRepeticaoConfiguracaoCasoUso {
  final String tarefaId;
  final String periodicidade;
  final List<String>? periodicidadeSemanal;
  final int? periodo;

  const AdicionarTarefaRepeticaoConfiguracaoCasoUso(this.tarefaId,
      this.periodicidade, this.periodicidadeSemanal, this.periodo);

  Future<TarefaRepeticaoConfiguracaoEntidade> adicionar(
      AdicionarTarefaRepeticaoConfiguracaoRequisicao requisicao);
}

class AdicionarTarefaRepeticaoConfiguracaoRequisicao extends Equatable {
  @override
  List<Object?> get props =>
      ['tarefaId', 'periodicidade', 'periodicidadeSemanal', 'periodo'];
}
