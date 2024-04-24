import 'package:binance_app/models/crypto_currency.dart';
import 'package:flutter/material.dart';

class CryptoProvider extends ChangeNotifier {
  List<CryptoCurrency> currencies = [CryptoCurrency('BTC', 10.0), CryptoCurrency('ETH', 20.9)];
}