import '../../entidades/tarefas/categoria_tarefa_entidade.dart';

abstract class SalvarCategoriaTarefaCasoUso {
  Future<void> salvar(CategoriaTarefaEntidade categoriaTarefa);
}
