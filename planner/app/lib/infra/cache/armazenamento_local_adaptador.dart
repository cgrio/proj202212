import 'package:app/data/cache/armazenamento_cache.dart';
import 'package:localstorage/localstorage.dart';

class ArmazenamentoLocalAdaptador implements ArmazenamentoLocal {
  final LocalStorage localStorage;

  ArmazenamentoLocalAdaptador({required this.localStorage});

  @override
  Future<void> salvar({required String chave, required dynamic valor}) async {
    await localStorage.deleteItem(chave);
    await localStorage.setItem(chave, valor);
  }

  @override
  Future<void> apagar(String chave) async {
    await localStorage.deleteItem(chave);
  }

  @override
  Future<dynamic> obter(String chave) async {
    return await localStorage.getItem(chave);
  }
}
