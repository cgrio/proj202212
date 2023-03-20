import 'package:app/dominio/entidades/lembretes/lembrete_entidade.dart';


abstract class ObterLembreteCasoUso {
  Future<LembreteEntidade> obter({required String lembreteId});
}
