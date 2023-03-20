import 'package:app/dominio/entidades/autenticacao/autenticacao_entidade.dart';

abstract class SalvarContaCasoUso {
  Future<void> salvar(AutenticacaoEntidade conta);
}
