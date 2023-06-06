import 'package:app/domain/auxiliares/dominio_erros.dart';
import 'package:app/domain/casos_uso/lembretes/adicionar_lembrete_casouso.dart';
import 'package:app/domain/entidades/lembretes/lembrete_entidade.dart';
import 'package:mocktail/mocktail.dart';

class AdicionarLembreteMock extends Mock implements AdicionarLembreteCasoUso {
  When mockAdicionarLembreteCall() => when(() => adicionar(any()));
  void mockAdicionarLembrete(LembreteEntidade data) => mockAdicionarLembreteCall().thenAnswer((_) async => data);
  void mockAdicionarLembreteErro(DominioErros error) => mockAdicionarLembreteCall().thenThrow(error);
}
