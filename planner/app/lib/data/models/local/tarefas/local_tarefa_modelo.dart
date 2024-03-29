import 'package:app/domain/entidades/tarefas/tarefa_entidade.dart';

class LocalTarefaModelo {
  LocalTarefaModelo(
      {required this.id,
      required this.titulo,
      required this.notas,
      required this.usuarioId,
      this.dataConclusao,
      this.dataAgendada,
      this.categoriaTarefaId});
  factory LocalTarefaModelo.fromEntity(TarefaEntidade tarefa) => LocalTarefaModelo(
      id: tarefa.id,
      titulo: tarefa.titulo,
      notas: tarefa.notas,
      dataConclusao: tarefa.dataConclusao,
      dataAgendada: tarefa.dataAgendada,
      categoriaTarefaId: tarefa.categoriaTarefaId,
      usuarioId: tarefa.usuarioId);

  //   id,
  //  titulo,
  //  notas,
  // dataConclusao,
  // dataAgendada,
  // categoriaTarefaId,
  // usuarioId

  factory LocalTarefaModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'titulo', 'notas'])) {
      throw Exception();
    }
    return LocalTarefaModelo(
        id: json['id'].toString(),
        titulo: json['titulo'].toString(),
        notas: json['notas'].toString(),
        dataConclusao: DateTime.parse(json['dataConclusao'].toString()),
        dataAgendada: DateTime.parse(json['dataAgendada'].toString()),
        categoriaTarefaId: json['categoriaTarefaId'].toString(),
        usuarioId: json['usuarioId'].toString());
  }
  final String id;
  final String titulo;
  final String notas;
  final DateTime? dataConclusao;
  final DateTime? dataAgendada;
  final String? categoriaTarefaId;
  final String? usuarioId;

  Map toJson() => {
        'id': id,
        'titulo': titulo,
        'notas': notas,
        'dataConclusao': dataConclusao,
        'dataAgendada': dataAgendada,
        'categoriaTarefaId': categoriaTarefaId,
        'usuarioId': usuarioId
      };

  TarefaEntidade toEntity() => TarefaEntidade(
        id: id,
        titulo: titulo,
        notas: notas,
        dataConclusao: dataConclusao,
        dataAgendada: dataAgendada,
        categoriaTarefaId: categoriaTarefaId,
        usuarioId: usuarioId,
      );
}
