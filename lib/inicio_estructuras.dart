import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'chewie_video.dart';
import 'colors.dart' as color;

class InicioEstructuras extends StatefulWidget{
  @override
  State<InicioEstructuras> createState() => _InicioEstructurasState();
}

class _InicioEstructurasState extends State<InicioEstructuras> {
  List _ListVideos=[];
  //List _listaPrueba=[];
  //ListView? _ListViewVideos;
  bool _playArea=false;
  VideoPlayerController? _controller;
  //late Future<void> _inizializeVideo;
  bool _isPlaying=false;
  bool _disposed=false;
  int _isPlayingIndex=-1;
  //late ChewieController _chewieControlador = _controller as ChewieController;
  late int _foreanIndex;

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
    } catch (e) {
      print("Error en la operación" + e.toString());
      return null;
    }
  }
  @override
  void initState() {
    super.initState();
    listado();
  }
  @override
  void dispose() {
    _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller=null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    listado();
    return Scaffold(
      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientF.withOpacity(0.9),
              color.AppColor.gradientS
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ):BoxDecoration(
          color: color.AppColor.gradientS,
        ),
        child: Column(
          children: [
            _playArea==false?Container(
              padding: const EdgeInsets.only(top: 70,left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(onTap:(){Navigator.of(context).pop();},child: IconButton(icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 228, 227, 227)), iconSize: 20, onPressed: ()=> {Navigator.of(context).pop()} ,)),
                      Expanded(child: Container()),
                      IconButton(icon:const Icon(Icons.info_outline, color: const Color.fromARGB(255, 228, 227, 227)), iconSize: 20, onPressed: ()=> {Navigator.of(context).pop()} ,)
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child:const Text("Estructura de",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 234, 233, 233)
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: const Text("Datos",
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
                        margin: const EdgeInsets.all(10),
                        //padding: EdgeInsets.only(right),
                        width: 350,
                        height:80,
                        //height: MediaQuery.of(context).size.height,
                        child: const AutoSizeText(
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
            ):Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(top: 50,left:30,right: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              _playArea=false;
                            });
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios,size: 20,color: Color.fromARGB(255, 244, 239, 239),),
                        ),
                        Expanded(child: Container()),
                        const Icon(Icons.info_outline,
                          size: 20,
                          color: Color.fromARGB(255, 244, 239, 239),
                        )
                      ],
                    ),
                  ),
                  _playView(context),
                  _controlView(context),
                ],
              ),
            ),
            _playArea==false?Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70)
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Container(
                      //color: Colors.red,
                      child: Row(
                        children: [
                          const SizedBox(height: 30,),
                          Container(
                            height: 60,
                            //color: Colors.red,
                            width: 250,
                            margin: const EdgeInsets.only(left: 30),
                            child:const AutoSizeText(
                              "Aprende la Estructura de Datos",
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 90, 89, 89)
                              ),
                            ),
                          ),
                          //SizedBox(height: 10,),
                          Container(
                            margin: const EdgeInsets.only(left:25),
                            //color: Colors.green,
                            child: Row(
                              children: [
                                Container(child: IconButton(icon: Icon(Icons.loop, color: color.AppColor.detail), iconSize: 25, onPressed: ()=> {Navigator.of(context).pop()} ,)),
                                //SizedBox(height: 0,),
                                const Text("Rep",style: TextStyle(fontSize: 15,color: Colors.grey),)
                              ],
                            ),
                          ),
                        ]
                      )
                    ),
                    const SizedBox(height: 5,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _ListVideos.length,
                        itemBuilder: (context,index){
                          //print("Leggoo, length!!!!!!");
                          //print(_ListVideos.length);
                        return GestureDetector(
                          onTap:(){
                            _onTapVideo(index);
                            //ChewieVideo(videoPlayerController: _onTapVideo(index),looping: false,);
                            debugPrint(index.toString());
                            setState(() {
                              _foreanIndex=index;
                              if(_playArea==false){
                                _playArea=true;
                              }
                            });
                          },
                          child: Container(
                            margin:const EdgeInsets.only(left: 30, right: 20),
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
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          width: 200,
                                          //color: Colors.green,
                                          child: AutoSizeText(
                                            _ListVideos[index]["nombreVideo"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                            ),
                                            maxLines: 2,
                                            maxFontSize:18,
                                            minFontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3),
                                          child: Container(
                                            width: 270,
                                            margin:const EdgeInsets.only(left: 10),
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
                                const SizedBox(height: 18,),
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
                                          margin: const EdgeInsets.only(left: 5),
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
            ):Expanded(
              child: Container(
                //margin: EdgeInsets.only(left: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70)
                  )
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        //color: Colors.red,
                        child: Row(
                          children: [
                            const SizedBox(height: 20,),
                            Container(
                              child: const Text(
                                "Descripción",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 90, 89, 89)
                                ),
                              ),
                            ),
                          ]
                        )
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        //color: Colors.red,
                        //width: MediaQuery.of(context).size.width,
                        width: 350,
                        height: 80,
                        child: AutoSizeText(
                          _ListVideos[_foreanIndex]["descripcionVideo"],
                          style: TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
                          maxLines: 4,
                          maxFontSize: 15,
                          minFontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        //margin: const EdgeInsets.only(left: 30),
                        child: const Text(
                          "Practica lo aprendido!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 90, 89, 89)
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        //color: Colors.red,
                        //width: MediaQuery.of(context).size.width,
                        width: 350,
                        height: 80,
                        child: const AutoSizeText(
                          "A continuación encontraras un editor de codigo para que practiques lo visto en el video.",
                          style: TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
                          maxLines: 4,
                          maxFontSize: 15,
                          minFontSize: 15,
                        ),
                      ),
                      //const SizedBox(height: 10,),
                      Container(
                        width: 350,
                        height: 350,
                        color: Colors.grey[700],
                        child: Row(
                          children: const [
                            Text(
                              "Editor de codigo - python ",
                              style: TextStyle(fontSize: 15,color:Colors.grey),
                            )
                          ],
                        ),
                      )
                    ]
                  ),
                )
              )
            )
          ],
        ) ,
      ),
    );
  }
  Widget _playView(BuildContext context){
    final controller=_controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: ChewieVideo(videoPlayerController: controller,looping: false,),
      );
    }else{
      return const AspectRatio(aspectRatio: 16/9, child: Center(child: Text("Preparando, porfavor espere..",style: TextStyle(fontSize: 20,color: Colors.white60),)));
    }

  }
  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress=0.0;

  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now=DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now+500;
    final controller=_controller;
    if(controller==null){
      debugPrint("Controlador es nulo");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controlador no ha sido inicializado");
      return;
    }
    if(_duration==null){
      _duration=_controller?.value.duration;
    }
    var duration=_duration;
    if(duration==null)return;

    var position=await controller.position;
    _position=position;

    final playing=controller.value.isPlaying;
    if(playing){
      if(_disposed)return;
      setState(() {
        _progress=position!.inMicroseconds.ceilToDouble()/duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying=playing;
  }

  String _convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }
  Widget _controlView(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          color: color.AppColor.gradientS,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed:()async{
                  final index=_isPlayingIndex-1;
                  if(index>=0&&_ListVideos.length>=0){
                    _onTapVideo(index);
                  }else{
                    Get.snackbar("Lista de Video", "",
                      snackPosition: SnackPosition.TOP,
                      icon: const Icon(Icons.face,
                      size: 30,
                      color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientS.withOpacity(0.7),
                      colorText: Colors.white,
                      messageText: const Text("No hay videos anteriores",style: TextStyle(fontSize: 20,color:Colors.white),)
                    );
                  }
                },
                icon:const Icon(Icons.fast_rewind,
                size: 36,
                color: Colors.white,
                shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0,1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ],
                )
              ),
              Center(
                child: Container(
                  //if(_foreanIndex!=null){},
                  margin: const EdgeInsets.only(left: 12,right: 10, top: 5),
                  width: 150,
                  child: Text(_ListVideos[_foreanIndex]["nombreVideo"],
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0,1.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      )
                    ]
                  ),
                  textAlign: TextAlign.center,),
                ),
              ),
              IconButton(
                onPressed:()async{
                  final index=_isPlayingIndex+1;
                  if(index<=_ListVideos.length-1){
                    _onTapVideo(index);
                  }else{
                    Get.snackbar("Lista de Video", "",
                      snackPosition: SnackPosition.TOP,
                      icon: const Icon(Icons.face,
                      size: 30,
                      color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientS.withOpacity(0.7),
                      colorText: Colors.white,
                      messageText: const Text("No hay mas videos en la lista",style: TextStyle(fontSize: 20,color:Colors.white),)
                    );
                  }
                },
                icon:const Icon(Icons.fast_forward,
                size: 36,
                color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0,1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ],
    );
  }


  _onTapVideo(int index)async{
    final controller=VideoPlayerController.network(_ListVideos[index]["linkVideo"]);
    final old = _controller;
    _controller=controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
    });
    controller..initialize().then((_){
      old?.dispose();
      _isPlayingIndex=index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      _foreanIndex=index;
      setState(() {
      });
    });
  }
}