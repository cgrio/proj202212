abstract class HttpCliente {
  Future<Map<String, dynamic>> requisicao({
    required String url,
    required String metodo,
    Map? corpo,
    Map? cabecalho,
  });
}
