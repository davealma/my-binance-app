class CryptoCurrency {
  String currency;
  double avgPrice;

  CryptoCurrency(this.currency, this.avgPrice);

  /*factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'symbol': String symbol
      } => 
      CryptoCurrency(symbol, 0.0),
      _ => throw const FormatException("Failed to load info")
    };
  }*/
}