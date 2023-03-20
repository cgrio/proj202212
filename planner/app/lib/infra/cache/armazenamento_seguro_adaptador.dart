import 'package:app/dados/cache/apagar_armazenamento_cache_seguro.dart';
import 'package:app/dados/cache/obter_armazenamento_cache_seguro.dart';
import 'package:app/dados/cache/salvar_armazenamento_cache_seguro.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ArmazenamentoSeguroAdaptador
    implements
        SalvarArmazenamentoSeguroCache,
        ObterArmazenamentoSeguroCache,
        ApagarArmazenamentoSeguroCache {
  final FlutterSecureStorage secureStorage;

  ArmazenamentoSeguroAdaptador({required this.secureStorage});

  @override
  Future<void> salvar({required String chave, required String valor}) async {
    await secureStorage.write(key: chave, value: valor);
  }

  @override
  Future<String?> obter(String chave) async {
    return await secureStorage.read(key: chave);
  }

  @override
  Future<void> apagar(String chave) async {
    await secureStorage.delete(key: chave);
  }
}
