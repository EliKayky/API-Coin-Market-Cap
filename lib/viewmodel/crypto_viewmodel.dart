import 'package:flutter/material.dart';
import '../data/repository/crypto_repository.dart';
import '../model/crypto_currency.dart';

class CryptoViewModel extends ChangeNotifier {
  final _repository = CryptoRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CryptoCurrency> _cryptoList = [];
  List<CryptoCurrency> get cryptoList => _cryptoList;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final String _defaultSymbols = 'BTC,ETH,SOL,BNB,BCH,MKR,AAVE,DOT,SUI,ADA,XRP,TIA,NEO,NEAR,PENDLE,RENDER,LINK,TON,XAI,SEI,IMX,ETHFI,UMA,SUPER,FET,USUAL,GALA,PAAL,AERO';

  Future<void> fetchCryptos({String? symbols}) async {
    _isLoading = true;
    _errorMessage = null; 
    notifyListeners();

    try {
      final symbolsToFetch = (symbols == null || symbols.isEmpty) ? _defaultSymbols : symbols;
      _cryptoList = await _repository.getCryptoQuotes(symbolsToFetch);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}