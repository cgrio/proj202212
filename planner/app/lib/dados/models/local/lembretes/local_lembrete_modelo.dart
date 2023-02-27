import 'package:app/dominio/entidades/lembretes/lembrete_entidade.dart';

class LocalLembreteModelo {
  final String id;
  final String nome;
  final DateTime? dataConclusao;
  final String usuarioId;
  final String cor;

  const LocalLembreteModelo(
      {required this.id,
      required this.nome,
      required this.usuarioId,
      this.dataConclusao,
      required this.cor});
  factory LocalLembreteModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'usuarioId'])) {
      throw Exception();
    }
    return LocalLembreteModelo(
        id: json['id'],
        nome: json['nome'],
        usuarioId: json['usuarioId'],
        dataConclusao: json['dataConclusao'] ? null : json['dataConclusao'],
        cor: json['cor']);
  }

  factory LocalLembreteModelo.fromEntity(LembreteEntidade entidade) =>
      LocalLembreteModelo(
          id: entidade.id,
          nome: entidade.nome,
          usuarioId: entidade.usuarioId,
          dataConclusao: entidade.dataConclusao,
          cor: entidade.cor);

  LembreteEntidade toEntity() => LembreteEntidade(
      id: id,
      nome: nome,
      usuarioId: usuarioId,
      dataConclusao: dataConclusao,
      cor: cor);

  Map toJson() => {
        'id': id,
        'nome': nome,
        'usuarioId': usuarioId,
        'dataConclusao': dataConclusao,
        'cor': cor
      };
}
