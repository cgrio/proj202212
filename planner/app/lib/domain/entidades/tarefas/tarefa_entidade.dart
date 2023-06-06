class TarefaEntidade {
  final String id;
  final String titulo;
  final String notas;
  final DateTime? dataConclusao;
  final DateTime? dataAgendada;
  final String? categoriaTarefaId;
  final String? usuarioId;

  TarefaEntidade(
      {required this.id,
      required this.titulo,
      required this.notas,
      this.dataConclusao,
      this.dataAgendada,
      this.categoriaTarefaId,
      this.usuarioId});
}
