import 'package:http/http.dart' as http;
import 'package:test_deals/utils/toast_msg/toast_msg.dart';

class AppExceptionHandler {
  static void handleException(dynamic e) {
    print('Error: $e');
    toastRedC("An error occurred: $e");
  }

  static void handleInternetException(dynamic e) {
    print('Internet Exception: $e');
    toastRedC("Internet Connection Error: Please check your internet connection");
  }

  static void handleSocketException(dynamic e) {
    print('Socket Exception: $e');
    toastRedC("Socket Connection Error: $e");
  }

  static void handleHttpException(http.Response response) {
    print('HTTP Exception: ${response.statusCode} ${response.reasonPhrase}');
    toastRedC("HTTP Error: ${response.statusCode} ${response.reasonPhrase}");
  }
}
