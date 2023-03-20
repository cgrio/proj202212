import '../../entidades/tarefas/tarefa_repeticao_entidade.dart';

abstract class SalvarTarefaRepeticaoCasoUso {
  Future<void> salvar(TarefaRepeticaoEntidade tarefaRepeticao);
}
