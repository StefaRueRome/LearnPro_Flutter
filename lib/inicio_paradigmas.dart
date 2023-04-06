import 'dart:convert';

import 'package:app_learn_pro/video.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'colors.dart' as color;

class InicioParadigmas extends StatefulWidget{
  @override
  State<InicioParadigmas> createState() => _InicioParadigmasState();
}

class _InicioParadigmasState extends State<InicioParadigmas> {
  List _ListVideos=[];
  List _listaPrueba=[];
  ListView? _ListViewVideos;

  Future<dynamic> listado() async {
    String url = "http://learnpro.bucaramanga.upb.edu.co:3000/courses/get";
    try {
      final res = await http.get(Uri.parse(url));
      print(res);
      dynamic jDatos = jsonDecode(utf8.decode(res.bodyBytes));
      _ListVideos=jDatos;
      print("Llego acaaaaa!!!!!!!!!!!!!!!!!!!!!!!!");
      print(jDatos);
      setState(() {
      });
      /*
      _ListViewVideos = ListView.builder(
          itemCount: jDatos["items"].length,
          itemBuilder: (context, index) {
            dynamic itm = jDatos["items"][index];
            return Video(
                id: itm["_id"],
                imagen: itm["imagen"],
                tema: itm["tema"],
                linkVideo: itm["linkVideo"],
                nombreVideo: itm["nombreVideo"],
                descripcionVideo: itm["descripcionVideo"],
                contenidoVideo: itm["contenidoVideo"],
                duracionVideo: itm["duracionVideo"]
                );
          });
      setState(() {});*/
    } catch (e) {
      print("Error en la operación" + e.toString());
      return null;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    listado();
  }
  @override
  Widget build(BuildContext context) {
    listado();
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
                        ]
                      )
                    ),
                    SizedBox(height: 5,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _ListVideos.length,
                        itemBuilder: (context,index){
                          print("Leggoo, length!!!!!!");
                          print(_ListVideos.length);
                        /*
                        dynamic itm = _ListVideos[index];
                        _ListVideos.add(Video(
                          id: itm["_id"],
                          imagen: itm["imagen"],
                          tema: itm["tema"],
                          linkVideo: itm["linkVideo"],
                          nombreVideo: itm["nombreVideo"],
                          descripcionVideo: itm["descripcionVideo"],
                          contenidoVideo: itm["contenidoVideo"],
                          duracionVideo: itm["duracionVideo"] ));
                          //_ListViewVideos= ListView(children: _ListVideos);
                        */
                          //setState(() {});
                        return GestureDetector(
                          onTap:(){
                            debugPrint(index.toString());
                          },
                          child: Container(
                            margin:EdgeInsets.only(left: 30, right: 20),
                            height: 180,
                            width: 200,
                            //color: Colors.red,
                            //color: Colors.amberAccent,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(_ListVideos[index]["imagen"]),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 200,
                                          //color: Colors.green,
                                          child: AutoSizeText(
                                            _ListVideos[index]["nombreVideo"],
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                            ),
                                            maxLines: 2,
                                            maxFontSize:18,
                                            minFontSize: 17,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: EdgeInsets.only(top: 3),
                                          child: Container(
                                            width: 270,
                                            margin: EdgeInsets.only(left: 10),
                                            child: AutoSizeText(
                                              _ListVideos[index]["descripcionVideo"],
                                              style: TextStyle(color: Colors.grey[500]),
                                              maxLines: 4,
                                              maxFontSize: 15,
                                              minFontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 18,),
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: color.AppColor.gradientS.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _ListVideos[index]["duracionVideo"],
                                          style: TextStyle(fontSize: 13,color: color.AppColor.gradientF),
                                        ),
                                      ),
                                    ),
                                    //SizedBox(height: ,),
                                    Row(
                                      children:[
                                        //for(int i=0;i<70;i++)
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Divider(),
                                          width: 270,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: color.AppColor.gradientF.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(2)
                                          ),
                                        )
                                      ]
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          
                        );
                      })
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