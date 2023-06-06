import 'package:app/domain/entidades/tarefas/tarefa_entidade.dart';

abstract class ObterTarefaCasoUso {
  Future<TarefaEntidade> obter({required String tarefaId});
}
