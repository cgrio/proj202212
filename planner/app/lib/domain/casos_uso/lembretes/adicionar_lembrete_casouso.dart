import 'package:equatable/equatable.dart';

import '../../entidades/lembretes/lembrete_entidade.dart';

abstract class AdicionarLembreteCasoUso {
  Future<LembreteEntidade> adicionar(AdicionarLembreteRequisicao requisicao);
}

class AdicionarLembreteRequisicao extends Equatable {
  final String nome;
  final String usuarioId;
  final DateTime? dataConclusao;
  final String? cor;

  const AdicionarLembreteRequisicao(
      {required this.nome,
      required this.usuarioId,
      this.dataConclusao,
      this.cor});

  @override
  List<Object?> get props => ['nome', 'login', 'email', 'senha'];
}
