abstract class ArmazenamentoLocal {
  Future<dynamic> obter(String chave);
  Future<dynamic> apagar(String chave);
  Future<dynamic> salvar({required String chave, required dynamic valor});
}
