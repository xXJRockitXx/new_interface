import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  String url;
  VideoScreen(this.url,{Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  /*BetterPlayerController betterPlayerController =
      BetterPlayerController(betterPlayerConfiguration);*/

  //final url = "gs://demos-d97a5.appspot.com/Modulo_1/playa.mp4";

  //final url = "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_1%2Fplaya.mp4?alt=media&token=6c3e8c9a-f53b-45d9-ac93-d96feeda7ad2";
  /*final url =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";*/
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: false, aspectRatio: 16 / 9, fit: BoxFit.contain);

    BetterPlayerDataSourceType type = BetterPlayerDataSourceType.network;

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(type, widget.url);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController!.setupDataSource(dataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    final WidgetArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Ejemplo de video"),
        backgroundColor: Colors.transparent,
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
            key: _betterPlayerKey, controller: _betterPlayerController!),
      ),
    );
  }
}
