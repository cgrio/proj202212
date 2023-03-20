import 'package:app/dominio/auxiliares/dominio_erros.dart';
import 'package:app/dominio/casos_uso/lembretes/adicionar_lembrete_casouso.dart';
import 'package:app/dominio/entidades/lembretes/lembrete_entidade.dart';
import 'package:mocktail/mocktail.dart';

class AdicionarLembreteMock extends Mock implements AdicionarLembreteCasoUso {
  When mockAdicionarLembreteCall() => when(() => this.adicionar(any()));
  void mockAdicionarLembrete(LembreteEntidade data) => this.mockAdicionarLembreteCall().thenAnswer((_) async => data);
  void mockAdicionarLembreteErro(DominioErros error) => this.mockAdicionarLembreteCall().thenThrow(error);
}
