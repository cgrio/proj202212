import 'package:app/validacao/validadores/campo_requerido_validador.dart';
import 'package:app/validacao/validadores/comparar_campos_validador.dart';
import 'package:app/validacao/validadores/email_validador.dart';
import 'package:app/validacao/validadores/tamanho_minimo_validador.dart';

import '../../validacao/protocolos/campo_validacao.dart';

class ValidacaoBuilder {
  static ValidacaoBuilder? _instancia;
  String campoNome;
  List<CampoValidacao> validacoes = [];

  ValidacaoBuilder._(this.campoNome);
  static ValidacaoBuilder campo(String campoNome) {
    _instancia = ValidacaoBuilder._(campoNome);
    return _instancia!;
  }

  ValidacaoBuilder requerido() {
    validacoes.add(CampoRequeridoValidador(campo: campoNome));
    return this;
  }

  ValidacaoBuilder email() {
    validacoes.add(EmailValidador(campo: campoNome));
    return this;
  }

  ValidacaoBuilder min(int tamanho) {
    validacoes.add(TamanhoMinimoValidador(campo: campoNome, tamanho: tamanho));
    return this;
  }

  ValidacaoBuilder compararCom(String campoParaComparar) {
    validacoes.add(CompararCamposValidador(campo: campoNome, campoParaComparar: campoParaComparar));
    return this;
  }

  List<CampoValidacao> build() => validacoes;
}
