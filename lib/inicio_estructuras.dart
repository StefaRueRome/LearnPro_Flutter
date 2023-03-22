import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InicioEstructuras extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnPro',
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(icon: const Icon(Icons.arrow_back),
                onPressed: ()=> {Navigator.of(context).pop()},),
              iconTheme: IconThemeData(color: Colors.white),
              //title: Text('Paradigmas de Programación'),
              backgroundColor: Color.fromARGB(255, 58, 184, 48),
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Estructura de Datos',style: TextStyle(fontSize: 16),),
                background: Image.network('http://learnpro.bucaramanga.upb.edu.co/logo.png',
                fit: BoxFit.cover,),
              ),
            ),
            SliverFillRemaining(
              child: _buildContent(),
            )
          ],
        )
      ),
    );
  }
  Center _buildContent(){
    return Center(
      child: Text('Hola mundo Estructuras'),
    );
  }


}