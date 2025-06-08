import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class CryptoApiDataSource {
  final String _apiKey = apiKey;
  final String _baseUrl = "pro-api.coinmarketcap.com";

  Future<Map<String, dynamic>> getQuotes(String symbols) async {
    final uri = Uri.https(_baseUrl, '/v2/cryptocurrency/quotes/latest', {
      'symbol': symbols,
    });

    final response = await http.get(uri, headers: {
      "Accepts": "application/json",
      "X-CMC_PRO_API_KEY": _apiKey,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao buscar dados da API: ${response.body}');
    }
  }
}