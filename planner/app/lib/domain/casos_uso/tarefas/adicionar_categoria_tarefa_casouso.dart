import 'package:equatable/equatable.dart';

import '../../entidades/tarefas/categoria_tarefa_entidade.dart';

abstract class AdicionarCategoriaTarefaCasoUso {
  final String nome;
  final String? categoriaTarefaId;
  final String? usuarioId;
  final String? cor;

  const AdicionarCategoriaTarefaCasoUso(
      this.nome, this.categoriaTarefaId, this.usuarioId, this.cor);
  Future<CategoriaTarefaEntidade> adicionar(
      AdicionarCategoriaTarefaRequisicao requisicao);
}

class AdicionarCategoriaTarefaRequisicao extends Equatable {
  @override
  List<Object?> get props => ['nome', 'categoriaTarefaId', 'usuarioId', 'cor'];
}
