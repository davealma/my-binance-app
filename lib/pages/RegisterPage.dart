import 'package:binance_app/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

final GlobalKey<FormState> registerFormKey = GlobalKey();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController =
      TextEditingController(text: "david@mail.com");
  TextEditingController passwordController =
      TextEditingController(text: "david");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "david");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Register"),
      ),
      body: Form(
        key: registerFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an Email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords don\'t match';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (registerFormKey.currentState!.validate()) {
                      registerUser(emailController.text,
                          passwordController.text, context);
                    }
                  },
                  child: const Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerUser(String email, String password, BuildContext context) {
    if (globals.userExist(email: email, password: password)) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        leading: const Icon(Icons.error),
        content: const Text("User already Exist"),
        actions: const [SizedBox()],
        backgroundColor: Colors.redAccent,
        onVisible: () {
          Future.delayed(const Duration(milliseconds: 2000), () {
            ScaffoldMessenger.of(
              context,
            ).removeCurrentMaterialBanner();
          });
        },
      ));
    } else {
      globals.registerUser(
          email: emailController.text, password: passwordController.text);
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        leading: const Icon(Icons.check),
        content: const Text("User Registered!"),
        actions: const [
          SizedBox(),
        ],
        backgroundColor: Colors.green[400],
        onVisible: () {
          Future.delayed(const Duration(milliseconds: 2000), () {
            ScaffoldMessenger.of(
              context,
            ).removeCurrentMaterialBanner();
            // Navigator.pop(context);
          });
        },
      ));
    }
  }
}
