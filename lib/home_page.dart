import 'dart:convert';

import 'package:app_learn_pro/providers/user_provider.dart';
import 'package:app_learn_pro/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'colors.dart' as color;
import 'inicio_estructuras.dart';
import 'inicio_paradigmas.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  Future _initData() async{
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info= json.decode(value);
    });
    setState(() {
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  void signOutUser(){
    AuthService().signOut(context);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    _initData();
    return Scaffold(
      backgroundColor: color.AppColor.homePageBack,
      drawer: Drawer(
        child: Container(
          color: color.AppColor.drawer,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //_buildDrawerHeader(context),
              Row(
                children: [
                  Expanded(child:
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 2),
                    //margin: EdgeInsets.only(top: 70),
                    //color: Colors.blue,
                    child: Column(
                      children:[
                        const SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: Text(user.name,
                          style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800)),
                          subtitle: Text(user.email, style: TextStyle(fontSize: 15,color: color.AppColor.gradientS),),
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.6),
                          indent: 32,
                          endIndent: 32,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 152, 255, 155),
                                  Icons.home,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Inicio",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                          child: Row(
                            children: const [
                              Icon(
                                color: Color.fromARGB(255, 152, 255, 155),
                                Icons.person,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Mi Perfil",
                                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 152, 255, 155),
                                  Icons.code,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Inicio Paradigmas",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioParadigmas()));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 152, 255, 155),
                                  Icons.data_array,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Inicio Estructura",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioEstructuras()));
                          },
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.6),
                          indent: 32,
                          endIndent: 32,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 152, 255, 155),
                                  Icons.settings,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Configuración",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 152, 255, 155),
                                  Icons.logout,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Salir",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            signOutUser();
                          },
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ]
          ),
        ),
      ),
      body: Container(
        //color: Colors.green,
        padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              child: Row(
                children: [
                  //SizedBox(height: 30,),
                  Text("Aprendiendo", style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 29, 29, 29),fontWeight: FontWeight.w700),),
                  //Icono Ponerlo despues
                  Expanded(child: Container()),
                  IconButton(onPressed: signOutUser,
                  icon: Icon(Icons.logout)
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                const Text("Tu Programa", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 29, 29, 29),fontWeight: FontWeight.w700),),
                //Icono Ponerlo despues
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[color.AppColor.gradientF.withOpacity(0.8), color.AppColor.gradientS.withOpacity(0.9)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)
                ),
                boxShadow: [
                    BoxShadow(
                    offset: const Offset(5 ,10),
                    blurRadius: 20,
                    color: color.AppColor.gradientS.withOpacity(0.2),
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Próximo video",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 234, 233, 233)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text("Descripción del video",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 234, 233, 233)
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.timer, size: 20, color: Color.fromARGB(255, 234, 233, 233),),
                            SizedBox(width: 10,),
                            Text("60 min",  /////Tiempo del video
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 234, 233, 233)
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientF,
                                blurRadius: 10,
                                offset: const Offset(4,8)
                              )
                            ]
                          ),
                          child:const Icon(Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              height: 180,
              //color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("images/card.png"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset:const Offset(8,10),
                          color: color.AppColor.gradientS.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 40,
                          offset:const Offset(-8,-5),
                          color: color.AppColor.gradientS.withOpacity(0.3),
                        )
                      ]
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150,top:50),
                    decoration:const BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.3),
                      //borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lo estás haciendo bien",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.detail,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(text: const TextSpan(
                          text: "Sigue así. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 84, 84),
                            fontSize: 16,
                          ),
                        ))
                      ]
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: const[
                Text(
                  "Materias",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 29, 29, 29)
                  ),
                )
              ],
            ),
            Expanded(child: SizedBox(
              //maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                  itemCount: info.length,
                  itemBuilder: (_,i){
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(info[i]['title']=="Paradigmas"){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioParadigmas()));
                            }else if(info[i]['title']=="Estructura"){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioEstructuras()));
                            }
                          },
                          child: Container(
                            width:(MediaQuery.of(context).size.width-90)/2,
                            height: 140,
                            margin: const EdgeInsets.only(bottom: 5,left: 5,top:20),
                            padding:const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[i]['img']
                                ),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset:const Offset(5,5),
                                  color: color.AppColor.gradientS.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset:const Offset(-5,-5),
                                  color: color.AppColor.gradientS.withOpacity(0.1),
                                )
                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[i]['title'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: color.AppColor.detail
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0
                      ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}