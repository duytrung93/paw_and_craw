import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/youtube_metadata_fetch.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class FollowVideoListPage extends StatefulWidget {
  const FollowVideoListPage({super.key});

  @override
  State<FollowVideoListPage> createState() => _FollowVideoListPageState();
}

class _FollowVideoListPageState extends State<FollowVideoListPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(child: VideoList());
  }
}

/// Creates list of video players
class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  Rx<User> get user => Get.find<UserController>().data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Follow the animals',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Shantell Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff4e69e),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/image87.png',
              width: 20,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
        padding: EdgeInsets.all(10),
        children: user.value.dataAnimal.videos
            .map((e) => VideoPlayer(video_id: e))
            .toList(),
      ),
    );
  }

  void testListen() {
    print(
        '=================================================================== READY==================================================');
  }
}

class VideoPlayer extends StatefulWidget {
  final String video_id;
  final bool isFullScreen;
  final int startAt;
  const VideoPlayer(
      {super.key,
      required this.video_id,
      this.isFullScreen = false,
      this.startAt = 0});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  late YoutubeMetadataFetch _videoMetaData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.video_id,
      flags: YoutubePlayerFlags(
        autoPlay: widget.isFullScreen,
        startAt: widget.startAt,
      ),
    );

    _videoMetaData = YoutubeMetadataFetch();
    getMetadata().then(
      (value) {
        setState(() {
          _videoMetaData = value;
        });
      },
    );
  }

  Future<YoutubeMetadataFetch> getMetadata() async {
    var response = await http.get(
      Uri.parse('https://www.youtube.com/oembed').replace(
        queryParameters: {
          'url': 'https://www.youtube.com/watch?v=${widget.video_id}',
          'format': 'json',
        },
      ),
    );
    var json = jsonDecode(response.body);
    print(response.request?.url);
    print(response.body);

    return YoutubeMetadataFetch.fromJson(json);
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        border: widget.isFullScreen
            ? null
            : Border.all(width: 1, color: Colors.grey),
        borderRadius:
            widget.isFullScreen ? BorderRadius.zero : BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius:
            widget.isFullScreen ? BorderRadius.zero : BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isFullScreen
                ? YoutubePlayer(
                    key: ObjectKey(widget.video_id),
                    controller: _controller,
                    actionsPadding: const EdgeInsets.only(left: 16.0),
                    bottomActions: [
                      CurrentPosition(),
                      SizedBox(width: 10),
                      ProgressBar(isExpanded: true),
                      SizedBox(width: 10),
                      RemainingDuration(),
                      // FullScreenButton(),
                      GestureDetector(
                        onTap: () {
                          if (widget.isFullScreen) {
                            Navigator.pop(context);
                          } else {
                            Global.to(
                              MainScaffold(
                                child: VideoPlayer(
                                  video_id: widget.video_id,
                                  isFullScreen: true,
                                  startAt: _controller.value.position.inSeconds,
                                ),
                              ),
                            );
                          }
                          // _controller.toggleFullScreenMode();
                          // launchUrlString(
                          //     'https://www.youtube.com/watch?v=${widget.video_id}');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // FullScreenButton(),
                    ],
                  )
                : Expanded(
                    child: _videoMetaData.thumbnail_url != null
                        ? GestureDetector(
                            onTap: () {
                              Global.to(
                                MainScaffold(
                                  child: VideoPlayer(
                                    video_id: widget.video_id,
                                    isFullScreen: true,
                                    startAt:
                                        _controller.value.position.inSeconds,
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              _videoMetaData.thumbnail_url!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
            widget.isFullScreen
                ? Container()
                : Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            _videoMetaData.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                // fontFamily: 'Shantell Sans',
                                ),
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
