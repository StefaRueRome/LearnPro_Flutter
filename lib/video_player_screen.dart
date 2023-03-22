import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controlador;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controlador = VideoPlayerController.network(
      'http://learnpro.bucaramanga.upb.edu.co/videos/paradigmas/1.mp4',
    );
    _initializeVideoPlayerFuture = _controlador.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de hacer dispose del VideoPlayerController para liberar los recursos
    _controlador.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Paradigmas'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Si el VideoPlayerController ha finalizado la inicialización, usa
            // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
            return AspectRatio(
              aspectRatio: _controlador.value.aspectRatio,
              // Usa el Widget VideoPlayer para mostrar el vídeo
              child: VideoPlayer(_controlador),
            );
          } else {
            // Si el VideoPlayerController todavía se está inicializando, muestra un
            // spinner de carga
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura
          // que se muestra el icono correcto
          setState(() {
            // Si el vídeo se está reproduciendo, pausalo.
            if (_controlador.value.isPlaying) {
              _controlador.pause();
            } else {
              // Si el vídeo está pausado, reprodúcelo
              _controlador.play();
            }
          });
        },
        // Muestra el icono correcto dependiendo del estado del vídeo.
        child: Icon(
          _controlador.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}