import '../../entidades/usuarios/usuarios_entidade.dart';

abstract class ObterUsuarioCasoUso {
  Future<UsuarioEntidade> obter({required String usuarioId});
}
