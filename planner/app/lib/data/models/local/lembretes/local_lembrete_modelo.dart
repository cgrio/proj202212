import 'package:app/domain/entidades/lembretes/lembrete_entidade.dart';

class LocalLembreteModelo {
  const LocalLembreteModelo({required this.id, required this.nome, required this.usuarioId, this.dataConclusao, required this.cor});

  factory LocalLembreteModelo.fromEntity(LembreteEntidade entidade) => LocalLembreteModelo(
      id: entidade.id, nome: entidade.nome, usuarioId: entidade.usuarioId, dataConclusao: entidade.dataConclusao, cor: entidade.cor);
  factory LocalLembreteModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'usuarioId'])) {
      throw Exception();
    }
    return LocalLembreteModelo(
        id: json['id'].toString(),
        nome: json['nome'].toString(),
        usuarioId: json['usuarioId'].toString(),
        dataConclusao: DateTime.parse(['dataConclusao'].toString()),
        cor: json['cor'].toString());
  }
  final String id;
  final String nome;
  final DateTime? dataConclusao;
  final String usuarioId;
  final String cor;

  LembreteEntidade toEntity() => LembreteEntidade(id: id, nome: nome, usuarioId: usuarioId, dataConclusao: dataConclusao, cor: cor);

  Map toJson() => {'id': id, 'nome': nome, 'usuarioId': usuarioId, 'dataConclusao': dataConclusao, 'cor': cor};
}
