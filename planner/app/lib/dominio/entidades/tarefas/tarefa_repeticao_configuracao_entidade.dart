class TarefaRepeticaoConfiguracaoEntidade {
  final String tarefaId;
  final String periodicidade;
  final List<String>? periodicidadeSemanal;
  final int? periodo;

  TarefaRepeticaoConfiguracaoEntidade(
      {required this.tarefaId,
      required this.periodicidade,
      this.periodicidadeSemanal,
      this.periodo});
}
