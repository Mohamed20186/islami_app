import 'package:dio/dio.dart';
import 'package:islami_app/core/api_manager/api_constants.dart';
import 'package:islami_app/models/radio_model/radio.dart';
import 'package:islami_app/models/radio_model/radio_model.dart';

class ApiManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  ));

  static Future<List<RadioModel>> getRadio() async {
    var response = await _dio.get(EndPoint.radios);
    return RadioListModel.fromJson(response.data).radios ?? [];
  }
}
