class TarefaRepeticaoEntidade {
  final String id;
  final String tarefaId;
  final String periodicidade;
  final DateTime? data;
  final String? diaSemana;

  TarefaRepeticaoEntidade(
      {required this.id,
      required this.tarefaId,
      required this.periodicidade,
      this.data,
      this.diaSemana});
}
