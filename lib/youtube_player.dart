import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({super.key});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  double _volume = 100;
  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];
  @override
  void initState() {

    super.initState();
    _controller=YoutubePlayerController(
      initialVideoId:_ids[2],

      flags:const YoutubePlayerFlags(
        useHybridComposition: true,
        showLiveFullscreenButton: false,
        forceHD: true,
        disableDragSeek:true,
        controlsVisibleAtStart:false,
        hideThumbnail: true,
        autoPlay:false,
        mute:false,
        isLive:false,
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player:  YoutubePlayer(

        controller:_controller,
        showVideoProgressIndicator:true,
        progressIndicatorColor:Colors.amber,
        progressColors:const ProgressBarColors(
        playedColor:Colors.amber,
        handleColor:Colors.amberAccent
    ),
    ), builder: (context , player ) {
          return Scaffold(
            appBar: AppBar(title: const Text("Youtube Player"),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  player,
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("Create by Raju",style: TextStyle(fontSize: 20),),
                    ],
                  )
                ],
              ),
            ),

          );
    },);
  }
}
