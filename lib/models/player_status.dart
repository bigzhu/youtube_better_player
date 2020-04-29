import 'package:flutter/material.dart';

class PlayerStatus {
  /*
  Returns the state of the player. Possible values are
     -1 – unstarted
     0 – ended
     1 – playing
     2 – paused
     3 – buffering
     5 – video cued
  */
  int state = -1;
  //Returns a number between 0 and 1 that specifies the percentage of the video that the player shows as buffered.
  double videoLoadedFraction;
  //Returns the elapsed time in seconds since the video started playing.
  int currentTime = 0;
  //Returns the duration in seconds of the currently playing video
  int duration = 0;
  String videoUrl = "";
  String videoEmbedCode = "";
}

class PlayerStatusNotifier extends ValueNotifier<PlayerStatus> {
  PlayerStatusNotifier() : super(PlayerStatus());
}
