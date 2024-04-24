import 'package:binance_app/pages/LoginPage.dart';
import 'package:binance_app/pages/WelcomePage.dart';
import 'package:binance_app/providers/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CryptoProvider())
      ],
      child: const MaterialApp(
        title: "Bitcoins Market",
        home: WelcomePage()
      ),
    );
  }

  
}