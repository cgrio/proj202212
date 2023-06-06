import 'package:app/domain/casos_uso/autenticacao/login_casouso.dart';
import 'package:app/domain/casos_uso/usuarios/adicionar_usuario_casouso.dart';

abstract class SalvarContaCasoUso {
  Future<void> salvar(AutenticacaoRequisicao conta);
}
