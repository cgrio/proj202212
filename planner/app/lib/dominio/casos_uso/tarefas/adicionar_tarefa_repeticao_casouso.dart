import 'package:equatable/equatable.dart';

import '../../entidades/tarefas/tarefa_repeticao_entidade.dart';

abstract class AdicionarTarefaRepeticaoCasoUso {
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  AdicionarTarefaRepeticaoCasoUso(
      this.tarefaId, this.periodicidade, this.data, this.diaSemana);

  Future<TarefaRepeticaoEntidade> adicionar(
      AdicionarTarefaRepeticaoRequisicao tarefaRepeticao);
}

class AdicionarTarefaRepeticaoRequisicao extends Equatable {
  @override
  List<Object?> get props => ['tarefaId', 'periodicidade', 'data', 'diaSemana'];
}
