import '../../entidades/tarefas/tarefa_repeticao_configuracao_entidade.dart';

abstract class SalvarTarefaRepeticaoConfiguracaoCasoUso {
  Future<void> salvar(
      TarefaRepeticaoConfiguracaoEntidade tarefaRepeticaoConfiguracao);
}
