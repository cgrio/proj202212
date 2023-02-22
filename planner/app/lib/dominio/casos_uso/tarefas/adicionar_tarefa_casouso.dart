import 'package:equatable/equatable.dart';

import '../../entidades/tarefas/tarefa_entidade.dart';

abstract class AdicionarTarefaCasoUso {
  Future<TarefaEntidade> adicionar(AdicionarTarefaRequisicao requisicao);
}

class AdicionarTarefaRequisicao extends Equatable {
  final String nome;
  final String? categoriaTarefaId;
  final String? usuarioId;
  final String? cor;

  const AdicionarTarefaRequisicao(
      {required this.nome, this.categoriaTarefaId, this.usuarioId, this.cor});

  @override
  List<Object?> get props => ['nome', 'categoriaTarefaId', 'usuarioId', 'cor'];
}
