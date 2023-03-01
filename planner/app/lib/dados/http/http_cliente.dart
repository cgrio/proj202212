abstract class HttpCliente {
  Future<Map<dynamic, dynamic>> requisicao({
    required String url,
    required String metodo,
    Map? corpo,
    Map? cabecalho,
  });
}
