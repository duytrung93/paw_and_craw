import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/youtube_metadata_fetch.dart';
import 'package:http/http.dart' as http;
import 'package:paw_and_craw/pages/follow_animals/view_video_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VideoItem extends StatefulWidget {
  final String video_id;
  const VideoItem({super.key, required this.video_id});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  YoutubeMetadataFetch _videoMetaData = YoutubeMetadataFetch();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: _videoMetaData.thumbnail_url != null
                  ? GestureDetector(
                      onTap: () {
                        if (!Platform.isAndroid) {
                          launchUrlString(
                            'https://www.youtube.com/watch?v=${widget.video_id}',
                            mode: LaunchMode.inAppWebView,
                          );
                          return;
                        }
                        Global.to(ViewVideoPage(video_id: widget.video_id));
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            _videoMetaData.thumbnail_url!,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withAlpha(100),

                                child: Icon(Icons.play_arrow, color: Colors.black,),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Row(
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

  void loadData() {
    getMetadata().then(
      (value) {
        setState(() {
          _videoMetaData = value;
        });
      },
    );
  }
}
