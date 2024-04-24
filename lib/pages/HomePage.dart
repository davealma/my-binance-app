import 'package:binance_app/charts/currency_chart.dart';
import 'package:binance_app/models/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CryptoCurrency> data = getData();

    return SafeArea(
      child: Scaffold(
        body: CurrencyChart(data: data),
      ),
    );
  }
  
  List<CryptoCurrency> getData() {
    final List<CryptoCurrency> data = [
      CryptoCurrency('ETC', 10.0),
      CryptoCurrency('BTC', 20.5),
    ];
    return data;
  }
}