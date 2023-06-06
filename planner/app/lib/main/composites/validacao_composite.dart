// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/presentation/protocols/validacao.dart';
import 'package:app/validacao/protocolos/campo_validacao.dart';

class ValidacaoComposite implements Validacao {
  final List<CampoValidacao> validacoes;
  ValidacaoComposite({
    required this.validacoes,
  });

  ValidacaoErro? validar({required String field, required Map input}) {
    ValidacaoErro? erro;
    for (final validacao in validacoes.where((elemento) => elemento.campo == field)) {
      erro = validacao.validar(input);
      if (erro != null) {
        return erro;
      }
    }
    return erro;
  }
}
