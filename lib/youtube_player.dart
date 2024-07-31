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

    '4MnxZC94HJA',
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
      initialVideoId:_ids[0],

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
                  const SizedBox(
                    height: 10,
                  ),
                  Text("হত্যা, গণপ্রেপ্তার, হামলা, মামলার প্রতিবাদে সারাদেশের বিভিন্ন জায়গায় 'মার্চ ফর জাস্টিস",style: TextStyle(fontSize: 20),),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Text("The Daily Star",style: TextStyle(fontSize: 20),),
                      Card(
                        color: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,horizontal: 15
                          ),
                          child: Text("Subscribe",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      )
                    ],
                  ),
                  Text("Create by Raju",style: TextStyle(fontSize: 20),),
                ],
              ),
            ),

          );
    },);
  }
}
