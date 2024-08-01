import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({super.key});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  bool volumeIsMute = false;

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
    controlPlayer();
  }

  void controlPlayer() {
    _controllers = videoIds
        .map((videoIds) => YoutubePlayerController(
            initialVideoId: videoIds,
            flags: YoutubePlayerFlags(
                useHybridComposition: true,
                showLiveFullscreenButton: false,
                forceHD: true,
                disableDragSeek: true,
                hideThumbnail: true,
                autoPlay: false,
                mute: volumeIsMute,
                enableCaption: true,
                captionLanguage: 'en')))
        .toList();
    setState(() {});
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
                    child: Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: YoutubePlayer(
                          bottomActions: <Widget>[
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                      ),
                                    )),
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.skip_next,
                                        color: Colors.white)),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        volumeIsMute = !volumeIsMute;
                                      });
                                    },
                                    child: volumeIsMute
                                        ? const Icon(Icons.music_note,
                                            color: Colors.white)
                                        : const Icon(Icons.music_off,
                                            color: Colors.white)),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                            RemainingDuration(),
                            FullScreenButton()
                          ],
                          aspectRatio: 4 / 2.5,
                          controller: _controllers[index],
                          showVideoProgressIndicator: true,
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
