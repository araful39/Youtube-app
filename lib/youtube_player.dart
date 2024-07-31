import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({super.key});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  double volume = 100;

  List<YoutubePlayerController> _controllers = [];
  final List<String> videoIds = [
    '3XF-nq9Qug4',
    'ULEQb_l-N08',
    'n2I7uJ_LkYY',
    'qQhhil2vBJc',
    '4MnxZC94HJA',
    'B6h-kQLQqec',
    'ZKPKpEoFxwk',
    'rK3ODIr4toU',
    'zari70_ppQw',
    'Kb_B9Td4kjE',
    'nu7xilUwFU4',
    'Us4cBROmAi8',
    'T8qMKs9Fjtg',
    '3-sTFakVb1g',
    'nPt8bK2gbaU',
    'f3N97PaP3SY',
    'gQDByCdjUXw',
    'CaQoj5hsecA',
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
    _controllers = videoIds
        .map((videoIds) => YoutubePlayerController(
            initialVideoId: videoIds,
            flags: const YoutubePlayerFlags(
              useHybridComposition: true,
              showLiveFullscreenButton: false,
              forceHD: true,
              disableDragSeek: true,
              hideThumbnail: true,
              autoPlay: false,
              mute: false,
              enableCaption: true,
              captionLanguage: 'en'
            )))
        .toList();
  }

  @override
  void dispose() {
    // Dispose the controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "YouTube Player",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const PageScrollPhysics(),
                shrinkWrap: true,
                itemCount: videoIds.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        YoutubePlayer(
                            bottomActions: <Widget>[
                              const SizedBox(width: 14.0),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous,color: Colors.white,)),
                              IconButton(onPressed: (){

                              }, icon: const Icon(Icons.skip_next,color: Colors.white)),
                              CurrentPosition(),
                              const SizedBox(width: 8.0),
                              ProgressBar(isExpanded: true),
                              RemainingDuration(),
                              FullScreenButton(
                                controller:_controllers[index] ,
                              ),


                            ],
                            aspectRatio: 4 / 2.5,

                          controller: _controllers[index],
                          showVideoProgressIndicator: true,
                        ),

                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
