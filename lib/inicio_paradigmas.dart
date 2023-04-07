import 'dart:convert';
import 'dart:math';

import 'package:app_learn_pro/chewie_video.dart';
import 'package:app_learn_pro/video.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class InicioParadigmas extends StatefulWidget{
  @override
  State<InicioParadigmas> createState() => _InicioParadigmasState();
}

class _InicioParadigmasState extends State<InicioParadigmas> {
  List _ListVideos=[];
  List _listaPrueba=[];
  ListView? _ListViewVideos;
  bool _playArea=false;
  VideoPlayerController? _controller;
  late Future<void> _inizializeVideo;
  bool _isPlaying=false;
  bool _disposed=false;
  int _isPlayingIndex=-1;

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
    //_inizializeVideo=_controller?.initialize()!;
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
              padding: EdgeInsets.only(top: 70,left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(onTap:(){Navigator.of(context).pop();},child: IconButton(icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 228, 227, 227)), iconSize: 20, onPressed: ()=> {Navigator.of(context).pop()} ,)),
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
                            debugPrint("tocado");
                          },
                          child: Icon(Icons.arrow_back_ios,size: 20,color: Color.fromARGB(255, 244, 239, 239),),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,
                          size: 20,
                          color: Color.fromARGB(255, 244, 239, 239),
                        )
                      ],
                    ),
                  ),
                  //ChewieVideo(videoPlayerController: VideoPlayerController.network(_ListVideos[inde]), looping: false),
                  _playView(context),
                  _controlView(context),
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
                            _onTapVideo(index);
                            debugPrint(index.toString());
                            setState(() {
                              if(_playArea==false){
                                _playArea=true;
                              }
                            });
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
  String _convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }
  Widget _controlView(BuildContext context){
    final noMute=(_controller?.value.volume??0)>0;
    final duration= _duration?.inSeconds??0;
    final head = _position?.inSeconds??0;
    final remained = max(0, duration-head);
    final mins = _convertTwo(remained ~/ 60.0);
    final secs = _convertTwo(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(color: Colors.white)
          ),
          child: Slider(
            value: max(0, min(_progress*100,100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress=value*0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration=_controller?.value?.duration;
              if(duration!=null){
                var newValue = max(0,min(value,99))*0.01;
                var millis=(duration.inMilliseconds*newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 5),
          color: color.AppColor.gradientS,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0,0.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(50, 0, 0, 0)
                          )
                        ]
                      ),
                      child: Icon(noMute?Icons.volume_up:Icons.volume_off, color: Colors.white,),
                    ),
                  ),
                  onTap: (){
                    if(noMute){
                      _controller?.setVolume(0);
                    }else{
                      _controller?.setVolume(1.0);
                    }
                    setState(() {
                    });
                  },
                ),
              ),
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
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 25,right: 25),
                child: IconButton(
                  onPressed:()async{
                    if(_isPlaying){
                      setState(() {
                        _isPlaying=false;
                      });
                      _controller?.pause();
                    }else{
                      setState(() {
                        _isPlaying=true;
                      });
                      _controller?.play();
                    }
                  },
                  icon: Icon(_isPlaying?Icons.pause:Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                  )
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
                      messageText: Text("No hay mas videos en la lista",style: TextStyle(fontSize: 20,color:Colors.white),)
                    );
                  }
                },
                icon:const Icon(Icons.fast_forward,
                size: 36,
                color: Colors.white,
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  "$mins:$secs",
                  style: TextStyle(
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0,1.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context){
    final controller=_controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
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
      setState(() {
      });
    });
  }
}