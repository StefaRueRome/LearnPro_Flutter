import 'dart:convert';

import 'package:app_learn_pro/home_page.dart';
import 'package:app_learn_pro/providers/user_provider.dart';
import 'package:app_learn_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../utils/constants.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  })async{
    try{
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: (){
          showSnackBar(context, 'Cuenta creada!, Logueate con las mismas credenciales!');
        },
      );

    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try{
      var userProvider= Provider.of<UserProvider>(context,listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signin'),
        body: jsonEncode(
          {
            'email':email,
            'password':password,
          }
        ),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(MaterialPageRoute(
            builder: (context)=> HomePage()///enviar usuario
          ),
          (route) => false,
          );
        }
      );

    }catch(e){
      showSnackBar(context, e.toString());

    }

  }
}