import 'package:binance_app/pages/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter an email";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (emailController.text == "david@gmail.com" && passwordController.text == "1234") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Incorrect Credentials")));
                }
              }else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Credentials are required")),);
              }
            }, child: const Text('Submit'),),)
          ],
        ),
      )),
    );
  }
}
