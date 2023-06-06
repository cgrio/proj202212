import 'package:app/data/cache/salvar_armazenamento_cache_seguro.dart';
import 'package:app/domain/auxiliares/dominio_erros.dart';
import 'package:app/domain/entidades/autenticacao/autenticacao_entidade.dart';

import '../../../../domain/casos_uso/autenticacao/salvar_conta_local_casouso.dart';

class LocalSalvarContaCasoUso implements SalvarContaLocalCasoUso {
  final SalvarArmazenamentoSeguroCache salvarArmazenamentoSeguroCache;
  LocalSalvarContaCasoUso(this.salvarArmazenamentoSeguroCache);

  @override
  Future<void> salvar(AutenticacaoEntidade conta) async {
    try {
      await salvarArmazenamentoSeguroCache.salvar(chave: 'token', valor: conta.token);
    } catch (error) {
      throw DominioErros.inesperado;
    }
  }
}
