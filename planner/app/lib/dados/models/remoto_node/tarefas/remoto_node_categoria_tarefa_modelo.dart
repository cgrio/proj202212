import 'package:app/dominio/entidades/tarefas/categoria_tarefa_entidade.dart';

import '../../../http/http.dart';

class RemotoNodeCategoriaTarefaModelo {
  const RemotoNodeCategoriaTarefaModelo({required this.id, required this.nome, this.categoriaTarefaId, this.usuarioId, this.cor});

  factory RemotoNodeCategoriaTarefaModelo.fromEntity(CategoriaTarefaEntidade categoria) => RemotoNodeCategoriaTarefaModelo(
      id: categoria.id, nome: categoria.nome, categoriaTarefaId: categoria.categoriaTarefaId, usuarioId: categoria.usuarioId, cor: categoria.cor);

  factory RemotoNodeCategoriaTarefaModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'nome',
      'categoriaTarefaId',
      'usuarioId',
      'cor',
    ])) {
      throw HttpErros.dadosInvalidos;
    }
    return RemotoNodeCategoriaTarefaModelo(
      id: json['id'].toString(),
      nome: json['nome'].toString(),
      categoriaTarefaId: json['categoriaTarefaId'].toString(),
      usuarioId: json['usuarioId'].toString(),
      cor: json['cor'].toString(),
    );
  }
  final String id;
  final String nome;
  final String? categoriaTarefaId;
  final String? usuarioId;
  final String? cor;

  Map toJson() => {'id': id, 'nome': nome, 'categoriaTarefaId': categoriaTarefaId, 'usuarioId': usuarioId, 'cor': cor};

  CategoriaTarefaEntidade toEntity() =>
      CategoriaTarefaEntidade(id: id, nome: nome, categoriaTarefaId: categoriaTarefaId, usuarioId: usuarioId, cor: cor);
}
