import 'package:app_learn_pro/home_page.dart';
import 'package:app_learn_pro/login/signup_page.dart';
import 'package:app_learn_pro/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers:[ChangeNotifierProvider(create: (_)=>UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Auth Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SignupPage(),
    );
  }

}