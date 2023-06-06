// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../entidades/tarefas/tarefa_repeticao_entidade.dart';

abstract class AdicionarTarefaRepeticaoCasoUso {
  Future<TarefaRepeticaoEntidade> adicionar(AdicionarTarefaRepeticaoRequisicao tarefaRepeticao);
}

class AdicionarTarefaRepeticaoRequisicao extends Equatable {
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  AdicionarTarefaRepeticaoRequisicao({
    required this.tarefaId,
    required this.periodicidade,
    this.data,
    this.diaSemana,
  });

  @override
  List<Object?> get props => ['tarefaId', 'periodicidade', 'data', 'diaSemana'];
}
