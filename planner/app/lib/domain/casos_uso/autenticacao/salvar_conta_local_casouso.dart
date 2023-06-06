import 'package:app/domain/casos_uso/usuarios/adicionar_usuario_casouso.dart';
import 'package:app/domain/entidades/autenticacao/autenticacao_entidade.dart';

abstract class SalvarContaLocalCasoUso {
  Future<void> salvar(AutenticacaoEntidade conta);
}
