import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> consultaFrete(String cep) async {
  final url = Uri.parse('https://www.cepcerto.com/ws/json/15085350');

   try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);

      if (dados.containsKey('erro') && dados['erro'] == true) {
        return null;
      }

      return dados;

    } else {
      
    }
  // ignore: empty_catches
  } catch (e) {
    
  }
  return null;
}