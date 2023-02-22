import '../../entidades/tarefas/categoria_tarefa_entidade.dart';

abstract class ObterCategoriaTarefaCasoUso {
  Future<CategoriaTarefaEntidade> obter({required String categoriaTarefaId});
}
