import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'colors.dart' as color;

class InicioParadigmas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientF.withOpacity(0.9),
              color.AppColor.gradientS
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70,left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 228, 227, 227)), iconSize: 20, onPressed: ()=> {Navigator.of(context).pop()} ,),
                      Expanded(child: Container()),
                      IconButton(icon: Icon(Icons.info_outline, color: const Color.fromARGB(255, 228, 227, 227)), iconSize: 20, onPressed: ()=> {Navigator.of(context).pop()} ,)
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Paradigmas de",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 234, 233, 233)
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Programación",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 234, 233, 233)
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        //color: Colors.red,
                        margin: EdgeInsets.all(10),
                        //padding: EdgeInsets.only(right),
                        width: 350,
                        height:80,
                        //height: MediaQuery.of(context).size.height,
                        child: AutoSizeText(
                          "Lorem Ipsum is simply dummy text of the printing" +
                          "and typesetting industry. Lorem Ipsum has been " +
                          "the industry's standard dummy text ever since the 1500s",
                          maxLines:4,
                          style: TextStyle(fontSize:15, color:Color.fromARGB(255, 234, 233, 233)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70)
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      //color: Colors.red,
                      child: Row(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              "Programación con python",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 90, 89, 89)
                              ),
                            ),
                          ),
                          //SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(left:25),
                            //color: Colors.green,
                            child: Row(
                              children: [
                                Container(child: IconButton(icon: Icon(Icons.loop, color: color.AppColor.detail), iconSize: 25, onPressed: ()=> {Navigator.of(context).pop()} ,)),
                                //SizedBox(height: 0,),
                                Text("Rep",style: TextStyle(fontSize: 15,color: Colors.grey),)
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ) ,
      ),
    );

    /*
    return MaterialApp(
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
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Paradigmas de Programación',style: TextStyle(fontSize: 16),),
                background: Image.network('http://learnpro.bucaramanga.upb.edu.co/logo.png',
                fit: BoxFit.cover,),
              ),
            ),
            SliverFillRemaining(
              child: _buildContent(),
            )/*
            SliverList(
              delegate: SliverChildBuilderDelegate(
            ))*/
          ],
        )
      ),
    );
  }
  Center _buildContent(){
    return Center(
      child: Text('Hola mundo'),
    ); */

  }


}