import '../../entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

abstract class ObterTarefaRepeticaoConfiguracaoCasoUso {
  Future<TarefaRepeticaoConfiguracaoEntidade> obter(
      {required String tarefaRepeticaoConfiguracaoId});
}
