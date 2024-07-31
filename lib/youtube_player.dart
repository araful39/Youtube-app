import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({super.key});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  double _volume = 100;

  List<YoutubePlayerController> _controllers = [];
  final List<String> videoIds = [
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
    _controllers = videoIds
        .map((videoIds) => YoutubePlayerController(
            initialVideoId: videoIds,
            flags: const YoutubePlayerFlags(
              useHybridComposition: true,
              showLiveFullscreenButton: false,
              forceHD: true,
              disableDragSeek: true,
              controlsVisibleAtStart: false,
              hideThumbnail: true,
              autoPlay: false,
              mute: false,
              isLive: false,
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
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Player"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: videoIds.length,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: YoutubePlayer(controller: _controllers[index],

          showVideoProgressIndicator: true,

          ),
        );
      }),
    );
  }
}
