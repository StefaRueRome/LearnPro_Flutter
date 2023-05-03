import 'dart:async';

import 'package:app_learn_pro/login/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart' as color;

class FlashView extends StatelessWidget{
  const FlashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignupPage()));});
    return Scaffold(
      backgroundColor: color.AppColor.drawer,
      body: const Center(
        child: Image(image: NetworkImage("http://learnpro.bucaramanga.upb.edu.co/logo.png")),
      ),

    );
  }

}