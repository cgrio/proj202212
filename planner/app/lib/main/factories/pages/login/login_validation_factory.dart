import 'package:app/main/builders/validacao_builder.dart';
import 'package:app/main/composites/validacao_composite.dart';
import 'package:app/presentation/protocols/validacao.dart';
import 'package:app/validacao/protocolos/campo_validacao.dart';

Validacao makeLoginValidation() => ValidacaoComposite(validacoes: makeLoginValidations());

List<CampoValidacao> makeLoginValidations() =>
    [...ValidacaoBuilder.campo('email').requerido().email().build(), ...ValidacaoBuilder.campo('senha').requerido().min(3).build()];
