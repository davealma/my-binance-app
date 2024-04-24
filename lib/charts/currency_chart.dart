import 'package:binance_app/models/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrencyChart extends StatelessWidget {
  final List<CryptoCurrency> data;
  
  const CurrencyChart({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      series: <CartesianSeries>[
        ColumnSeries<CryptoCurrency, String>(
          xValueMapper: (CryptoCurrency curr, _) => curr.currency.toString(), 
          yValueMapper: (CryptoCurrency curr, _) => curr.avgPrice, 
          dataSource: data,
        ),
      ],
    );
  }

}