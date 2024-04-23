import 'package:binance_app/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int imageTag = 1;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bitcoins Market",
      home: LoginPage()
    );
  }

  
}