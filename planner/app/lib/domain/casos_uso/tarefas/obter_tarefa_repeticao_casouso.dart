import '../../entidades/tarefas/tarefa_repeticao_entidade.dart';

abstract class ObterTarefaRepeticaoCasoUso {
  Future<TarefaRepeticaoEntidade> obter(
      {required String tarefaRepeticaoId});
}
