import 'package:flutter/material.dart';
import 'package:islami_app/core/api_manager/api_manager.dart';
import 'package:islami_app/models/radio_model/radio.dart';
import 'package:provider/provider.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];
  bool isLoading = true;
  Future<void> getRadios() async {
    radios = await ApiManager.getRadio();
    isLoading = false;
    notifyListeners();
  }
}
