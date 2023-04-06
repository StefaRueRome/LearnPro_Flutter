import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
class Video extends StatelessWidget {
  final String id;
  final String imagen;
  final String tema;
  final String linkVideo;
  final String nombreVideo;
  final String descripcionVideo;
  final String contenidoVideo;
  final String duracionVideo;

  const Video({
    super.key,
    required this.id,
    required this.imagen,
    required this.tema,
    required this.linkVideo,
    required this.nombreVideo,
    required this.descripcionVideo,
    required this.contenidoVideo,
    required this.duracionVideo,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
