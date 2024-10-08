import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> consultaCep(String cep) async {
  final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      // print('Dados recebidos: $dados');

      if (dados.containsKey('erro') && dados['erro'] == true) {
        return null;
      }

      return dados;

    } else {
      // print('Falha na requisição. Código de status: ${response.statusCode}');
    }
  } catch (e) {
    // print('Erro ao conectar à API: $e');
  }
  return null;
}


