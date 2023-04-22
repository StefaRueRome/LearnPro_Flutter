import 'package:app_learn_pro/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authService = AuthService();
  void signupUser(){
    authService.signUpUser(context: context, email: emailController.text, password: passwordController.text, name: nameController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign In",
          style: TextStyle(
            fontSize: 34,
            fontFamily: "Poppins",
          ),
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(vertical: 16)),
        const Text("Refuerza tus conocimientos en Paradigmas de Programación y en Estructura de Datos con LearnPro",
        textAlign: TextAlign.center,
        ),
        Text("Name",style: TextStyle(color: Colors.black),),
        Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.email_outlined), //
              )
            ),

          ),
        ),
        Text("Email",style: TextStyle(color: Colors.black),),
        Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: TextFormField(
            controller: emailController,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child:Icon(Icons.password), 
              )
            ),

          ),
        ),
        Text("Password",style: TextStyle(color: Colors.black),),
        Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.email_outlined), //
              )
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: ElevatedButton.icon(
            onPressed: () {
              signupUser();
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
            icon: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 17, 254, 0),),
            label: const Text("Sign In"),
          ),
        )
      ],
    ));
  }
}