abstract class HttpCliente {
  Future<dynamic> requisicao({
    required String url,
    required String metodo,
    Map? corpo,
    Map? cabecalho,
  });
}
