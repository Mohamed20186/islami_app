import 'package:flutter/material.dart';
import 'package:islami_app/core/api_manager/api_manager.dart';
import 'package:islami_app/models/radio_model/radio.dart';
import 'package:provider/provider.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];
  bool isLoading = true;
  bool isError = false;
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
}
