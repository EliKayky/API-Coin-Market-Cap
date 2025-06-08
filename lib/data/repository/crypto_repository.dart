import '../datasource/crypto_api_datasource.dart';
import '../../model/crypto_currency.dart';

class CryptoRepository {
  final _apiDataSource = CryptoApiDataSource();

  Future<List<CryptoCurrency>> getCryptoQuotes(String symbols) async {
    try {
      final Map<String, dynamic> apiResponse = await _apiDataSource.getQuotes(symbols);
      final data = apiResponse['data'] as Map<String, dynamic>;

      final cryptoList = data.values.map((cryptoJson) {
        return CryptoCurrency.fromJson(cryptoJson[0]); 
      }).toList();

      return cryptoList;
    } catch (e) {
      throw Exception('Erro no repositório: $e');
    }
  }
}