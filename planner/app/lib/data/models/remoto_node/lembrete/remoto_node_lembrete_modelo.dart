import 'package:app/data/http/http_erros.dart';
import 'package:app/domain/entidades/lembretes/lembrete_entidade.dart';

class RemotoNodeLembreteModelo {
  const RemotoNodeLembreteModelo({required this.id, required this.nome, required this.usuarioId, this.dataConclusao, required this.cor});
  factory RemotoNodeLembreteModelo.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'nome', 'usuarioId'])) {
      throw HttpErros.dadosInvalidos;
    }
    return RemotoNodeLembreteModelo(
        id: json['id'].toString(),
        nome: json['nome'].toString(),
        usuarioId: json['usuarioId'].toString(),
        dataConclusao: DateTime.parse(json['dataConclusao'].toString()),
        cor: json['cor'].toString());
  }
  final String id;
  final String nome;
  final DateTime? dataConclusao;
  final String usuarioId;
  final String cor;

  LembreteEntidade toEntity() => LembreteEntidade(id: id, nome: nome, usuarioId: usuarioId, dataConclusao: dataConclusao, cor: cor);
}
