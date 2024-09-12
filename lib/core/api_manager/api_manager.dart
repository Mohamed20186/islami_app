import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/core/api_manager/api_constants.dart';
import 'package:islami_app/models/radio_model/radio.dart';
import 'package:islami_app/models/radio_model/radio_model.dart';

class ApiManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  ));

  static Future<Either<String, List<RadioModel>>> getRadio() async {
    try {
      var response = await _dio.get(EndPoint.radios);
      var radios = RadioListModel.fromJson(response.data).radios ?? [];
      return right(radios);
    } catch (e) {
      return left(e.toString());
    }
  }
}
