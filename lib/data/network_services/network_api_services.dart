import 'dart:convert';
import 'dart:io';
import '../../res/api_url/api_urls.dart';
import '../app_exceptions/app_exception.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {

  @override
  Future getAPI(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(url),headers: {
        AppApiURL.headers_key: AppApiURL.headers_value,},).timeout(const Duration(seconds: 120),onTimeout: (){
        return Future.error("TimeOut");
      });
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
      } else {
        AppExceptionHandler.handleHttpException(response);
      }
    } catch (e) {
      if (e is http.ClientException) {
        AppExceptionHandler.handleInternetException(e);
      } else if (e is SocketException) {
        AppExceptionHandler.handleSocketException(e);
      } else {
        AppExceptionHandler.handleException(e);
      }
    }
    return responseJson;
  }

}