import 'package:app_learn_pro/home_page.dart';
import 'package:app_learn_pro/inicio_estructuras.dart';
import 'package:app_learn_pro/inicio_paradigmas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:video_player/video_player.dart';

import 'chewie_video.dart';

void main() => runApp(MaterialApp(
  title: "App",
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class Inicio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
                _buildDrawerHeader(context),
                const ListTile(
                  horizontalTitleGap: 0,
                  leading: Icon(Icons.person),
                  title: Text('Perfil'),
                  trailing: Icon(Icons.arrow_right, color: Colors.black,)
                  ,
                ),
                const Divider(color: Colors.black,),
                ListTile(
                  horizontalTitleGap: 0,
                  leading:const Icon(Icons.code),
                  title: const Text('Paradigmas de Programación'),
                  trailing: const Icon(Icons.arrow_right, color: Colors.black,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioParadigmas()));
                    //Get.to(InicioParadigmas());
                  }
                ),
                const Divider(color: Colors.black,),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(Icons.data_array),
                  title: const Text('Estructura de Datos'),
                  trailing: const Icon(Icons.arrow_right, color: Colors.black,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InicioEstructuras()));
                  }
                )
            ],
          ),
        ),
        appBar: AppBar(backgroundColor: const Color.fromARGB(242, 22, 134, 3),title: const Text("Inicio")),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 250,
              child:
              ChewieVideo(
                videoPlayerController: VideoPlayerController.network('http://learnpro.bucaramanga.upb.edu.co/videos/paradigmas/1.mp4'),
                looping: false,
              ),),
            const SizedBox(height: 20),
            SizedBox(height: 250,
              child:
            ChewieVideo(
              videoPlayerController: VideoPlayerController.network('http://learnpro.bucaramanga.upb.edu.co/videos/paradigmas/2.mp4'),
              looping: false,
            ),)
          ],
        )
    );
  }
  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context){
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: Color.fromARGB(242, 22, 134, 3)),
      accountName: const Text('Pedro Gómez'), 
      accountEmail: const Text('pipe22007@gmail.com'),
      currentAccountPicture: GestureDetector(
        child: const CircleAvatar(backgroundColor: Colors.black, backgroundImage: NetworkImage('http://learnpro.bucaramanga.upb.edu.co/logo.png'),),
      )
      ,
    );
  }
}
