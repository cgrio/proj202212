import 'package:app/dominio/entidades/tarefas/tarefa_entidade.dart';

abstract class SalvarTarefaCasoUso {
  Future<void> salvar(TarefaEntidade tarefa);
}
