class CategoriaTarefaEntidade {
  final String id;
  final String nome;
  final String? categoriaTarefaId;
  final String? usuarioId;
  final String? cor;

  const CategoriaTarefaEntidade(
      {required this.id,
      required this.nome,
      this.categoriaTarefaId,
      this.usuarioId,
      this.cor});
}
