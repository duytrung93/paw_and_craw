import 'package:flutter/material.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/pages/follow_animals/follow_video_list_page.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ViewVideoPage extends StatefulWidget {
  final String video_id;
  const ViewVideoPage({super.key, required this.video_id});

  @override
  State<ViewVideoPage> createState() => _ViewVideoPageState();
}

class _ViewVideoPageState extends State<ViewVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        showControls: true,
      ),
    );
    _controller.loadVideoById(videoId: widget.video_id);
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: YoutubePlayer(
              controller: _controller,
            ),
          ),
          Positioned(
            right: 0,
            top: 8,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(190),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/image87.png',
                    width: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
