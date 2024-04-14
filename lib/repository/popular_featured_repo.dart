import 'dart:developer';

import '../data/network_services/network_api_services.dart';
import '../res/api_url/api_urls.dart';

class PopularsRepository{
  final _networkApiServices = NetworkApiServices();

  Future<dynamic> popularDealsAPICall() async {
    final response = await _networkApiServices.getAPI(AppApiURL.popular_featuredAPI);
    log(response.toString());
    return response;
  }
}