abstract class Validacao {
  ValidacaoErro? validar({required String field, required Map input});
}

enum ValidacaoErro { campoRequerido, campoInvalido }
