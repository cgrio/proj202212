class TarefaRepeticaoConfiguracaoEntidade {
  final String id;
  final String tarefaId;
  final String periodicidade;
  final List<String>? periodicidadeSemanal;
  final int? periodo;

  TarefaRepeticaoConfiguracaoEntidade(
      {required this.id,
      required this.tarefaId,
      required this.periodicidade,
      this.periodicidadeSemanal,
      this.periodo});
}
