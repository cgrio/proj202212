import 'package:app/dominio/entidades/tarefas/tarefa_entidade.dart';

abstract class ObterTarefaCasoUso {
  Future<TarefaEntidade> obter({required String tarefaId});
}
