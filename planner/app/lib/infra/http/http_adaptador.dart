import 'package:app/dados/http/http_erros.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:app/dados/http/http_cliente.dart';

class HttpAdaptador implements HttpCliente {
  final Client cliente;

  HttpAdaptador(this.cliente);

  @override
  Future<Map<String, dynamic>> requisicao({required String url, required String metodo, Map? corpo, Map? cabecalho}) async {
    final cabecalhoPadrao = cabecalho?.cast<String, String>() ?? {}
      ..addAll({'content-type': 'application/json', 'accept': 'application/json'});
    final jsonCorpo = corpo != null ? jsonEncode(corpo) : null;
    var resposta = Response('', 500);
    Future<Response>? futureResponse;
    try {
      if (metodo == 'post') {
        futureResponse = cliente.post(Uri.parse(url), headers: cabecalhoPadrao, body: jsonCorpo);
      } else if (metodo == 'get') {
        futureResponse = cliente.get(Uri.parse(url), headers: cabecalhoPadrao);
      } else if (metodo == 'put') {
        futureResponse = cliente.put(Uri.parse(url), headers: cabecalhoPadrao, body: jsonCorpo);
      }
      if (futureResponse != null) {
        resposta = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpErros.servidorErro;
    }
    return _handleResponse(resposta);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpErros.requisicaoRuim;
      case 401:
        throw HttpErros.naoAutorizado;
      case 403:
        throw HttpErros.proibido;
      case 404:
        throw HttpErros.naoEncontrado;
      default:
        throw HttpErros.servidorErro;
    }
  }
}
