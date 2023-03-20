import '../../entidades/lembretes/lembrete_entidade.dart';

abstract class SalvarLembreteCasoUso {
  Future<void> salvar(LembreteEntidade lembrete);
}
