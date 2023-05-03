import 'package:app_learn_pro/editor/editor.dart';
import 'package:app_learn_pro/home_page.dart';
import 'package:app_learn_pro/login/signup_page.dart';
import 'package:app_learn_pro/providers/user_provider.dart';
import 'package:app_learn_pro/services/auth_services.dart';
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

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auth Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SignupPage()  //Provider.of<UserProvider>(context).user.token.isEmpty? SignupPage() : HomePage(),
    );
  }
}