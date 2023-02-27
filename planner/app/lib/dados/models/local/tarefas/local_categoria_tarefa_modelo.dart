import 'package:app/dominio/entidades/tarefas/categoria_tarefa_entidade.dart';

class LocalCategoriaTarefaModelo {
  final String id;
  final String nome;
  final String? categoriaTarefaId;
  final String? usuarioId;
  final String? cor;

  const LocalCategoriaTarefaModelo(
      {required this.id,
      required this.nome,
      this.categoriaTarefaId,
      this.usuarioId,
      this.cor});

  factory LocalCategoriaTarefaModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'nome',
      'categoriaTarefaId',
      'usuarioId',
      'cor',
    ])) {
      throw Exception();
    }
    return LocalCategoriaTarefaModelo(
      id: json['id'],
      nome: json['nome'],
      categoriaTarefaId: json['categoriaTarefaId'],
      usuarioId: json['usuarioId'],
      cor: json['cor'],
    );
  }

  factory LocalCategoriaTarefaModelo.fromEntity(
          CategoriaTarefaEntidade categoria) =>
      LocalCategoriaTarefaModelo(
          id: categoria.id,
          nome: categoria.nome,
          categoriaTarefaId: categoria.categoriaTarefaId,
          usuarioId: categoria.usuarioId,
          cor: categoria.cor);

  Map toJson() => {
        'id': id,
        'nome': nome,
        'categoriaTarefaId': categoriaTarefaId,
        'usuarioId': usuarioId,
        'cor': cor
      };

  CategoriaTarefaEntidade toEntity() => CategoriaTarefaEntidade(
      id: id,
      nome: nome,
      categoriaTarefaId: categoriaTarefaId,
      usuarioId: usuarioId,
      cor: cor);
}
