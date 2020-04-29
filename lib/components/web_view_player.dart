import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/player_status.dart';
import '../models/player_controller.dart';

import 'dart:io';

class WebViewPlayer extends StatefulWidget {
  WebViewPlayer({
    Key key,
    @required this.videoId,
    this.playerController,
    this.playerStatusNotifier,
    this.onReady,
    this.onStateChange,
    this.onPlaybackQualityChange,
    this.onPlaybackRateChange,
    this.onError,
    this.onApiChange,
  }) : super(key: key);
  final videoId;
  final PlayerController playerController;
  final PlayerStatusNotifier playerStatusNotifier;
  final Function onReady;
  final Function onStateChange;
  final Function onPlaybackQualityChange;
  final Function onPlaybackRateChange;
  final Function onError;
  final Function onApiChange;
  @override
  _WebViewPlayerState createState() => _WebViewPlayerState();
}

class _WebViewPlayerState extends State<WebViewPlayer> {
  WebViewController _webViewController;
  String _videoId;
  @override
  initState() {
    _videoId = widget.videoId;
    super.initState();
  }

  String get baseUrl {
    String baseUrl = 'https://bigzhu.github.io/youtube_player';
    /*
    if (Platform.isAndroid) {
      baseUrl = '$baseUrl/android';
    } else if (Platform.isIOS) {
      baseUrl = '$baseUrl/ios';
    }
    */
    return baseUrl;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        initialUrl: baseUrl,
        onWebViewCreated: (webController) {
          _webViewController = webController;
        },
        onPageFinished: (webController) {
          _webViewController.evaluateJavascript('player.loadVideoById("$_videoId", 0)');
        },
      ),
    );
  }
}
