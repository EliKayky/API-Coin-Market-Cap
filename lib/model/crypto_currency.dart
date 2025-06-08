import 'package:intl/intl.dart';

class CryptoCurrency {
  final int id;
  final String name;
  final String symbol;
  final DateTime dateAdded;
  final double priceUsd;
  final double priceBrl;

  CryptoCurrency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUsd,
    this.priceBrl = 0.0,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      dateAdded: DateTime.parse(json['date_added']),
      priceUsd: (json['quote']['USD']['price'] as num).toDouble(),
    );
  }

  String get formattedPriceUsd {
    return NumberFormat.currency(locale: 'en_US', symbol: 'US\$ ').format(priceUsd);
  }
 
  String get formattedPriceBrl {
    final brlPrice = priceUsd * 5.56; // Cotação do dolar no dia 07/08/2025
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$ ').format(brlPrice);
  }
}