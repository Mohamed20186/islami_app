import 'package:flutter/material.dart';
import 'package:islami_app/core/api_manager/api_manager.dart';
import 'package:islami_app/models/radio_model/radio.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];
  bool isLoading = true;
  bool isError = false;
  int _currentIndex = 0;
  final player = AudioPlayer();

  Future<void> getRadios() async {
    var result = await ApiManager.getRadio();
    result.fold((l) {
      isLoading = false;
      isError = true;
    }, (r) {
      radios = r;
      isLoading = false;
    });

    notifyListeners();
  }

  RadioModel get currentRadio => radios[_currentIndex];
  bool get isPlaying => player.state == PlayerState.playing;
  void play() {
    if (player.state == PlayerState.playing) {
      player.pause();
    } else if (player.state == PlayerState.paused) {
      player.resume();
    } else {
      player.play(
        UrlSource(radios[_currentIndex].url),
      );
    }
    notifyListeners();
  }

  next() {
    if (radios.length - 1 == _currentIndex) {
      return;
    } else {
      _currentIndex++;
    }
    player.stop();
    notifyListeners();
  }

  prev() {
    if (_currentIndex == 0) {
      return;
    } else {
      _currentIndex--;
    }
    player.stop();
    notifyListeners();
  }
}
