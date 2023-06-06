class LembreteEntidade {
  final String id;
  final String nome;
  final DateTime? dataConclusao;
  final String usuarioId;
  final String cor;

  const LembreteEntidade(
      {required this.id,
      required this.nome,
      required this.usuarioId,
      this.dataConclusao,
      required this.cor});
}
