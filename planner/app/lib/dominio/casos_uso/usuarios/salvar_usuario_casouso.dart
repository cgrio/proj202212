import 'package:app/dominio/entidades/usuarios/usuarios_entidade.dart';

abstract class SalvarUsuarioCasoUso {
  Future<void> salvar(UsuarioEntidade usuario);
}
