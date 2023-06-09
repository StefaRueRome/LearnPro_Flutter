import 'package:app_learn_pro/home_page.dart';
import 'package:app_learn_pro/login/login_page.dart';
import 'package:app_learn_pro/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

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
    return Scaffold(body: 
    Center(
      child: Container(
        decoration: const BoxDecoration(),///terminar
        width: 350,
        height: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Regístrate",
                style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10)),
            const Text("Refuerza tus conocimientos en Paradigmas de Programación y en Estructura de Datos con LearnPro",
            textAlign: TextAlign.center,
            ),
            const Text("Nombre",style: TextStyle(color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: TextField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 216, 3)),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),
            ),
            const Text("Email",style: TextStyle(color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 216, 3)),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),
            ),
            const Text("Contraseña",style: TextStyle(color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 216, 3)),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  signupUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 93, 220, 102),
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
                icon: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 15, 183, 3),),
                label: const Text("Registrarse"),
              ),
            ),
            const SizedBox(height: 15,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ya estás registrado?. "),
                  InkWell(child:const Text("Accede", style: TextStyle(color: Color.fromARGB(255, 13, 223, 76),decoration: TextDecoration.underline),),onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  })
                ],
              ),
            ),
            const SizedBox(height: 15,),
            
          ],
        ),
      ),
    ));
  }
}