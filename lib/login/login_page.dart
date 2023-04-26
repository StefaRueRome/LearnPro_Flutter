import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser(){
    authService.signInUser(context: context, email: emailController.text, password: passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Center(
      child: Container(
        decoration: BoxDecoration(),///terminar
        width: 350,
        height: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 16)),
            const Text("Refuerza tus conocimientos en Paradigmas de Programación y en Estructura de Datos con LearnPro",
            textAlign: TextAlign.center,
            ),
            Text("Email",style: TextStyle(color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 216, 3)),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),
            ),
            Text("Contraseña",style: TextStyle(color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 216, 3)),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: ElevatedButton.icon(
                onPressed: () {
                  loginUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 133, 235, 140),
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)
                    )
                  )
                ),
                icon: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 13, 223, 76),),
                label: const Text("Login"),
              ),
            )
          ]
        )
      )
    ));
  }
}