import 'package:flutter/material.dart';
import 'package:fluttertest1/components/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Column(
        children: [
          // kita isi textfield username, password, dan button
          Text(
            "Welcome to Application " + statusLogin.toString(),
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 62, 4, 223),
              fontStyle: FontStyle.italic,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              txtController: txtUsername,
              myHint: "input username",
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              txtController: txtPassword,
              myHint: "Input password",
              obscureText: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String username = txtUsername.text.toString();
                    String password = txtPassword.text.toString();
                    if (username == "admin" && password == "admin") {
                      print("sukses login");
                      statusLogin = "admin";
                    } else {
                      print("gagal login");
                      statusLogin = "failed";
                    }
                  });
                },
                child: Text("Login"),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Register")),
            ],
          ),
        ],
      ),
    );
  }
}
