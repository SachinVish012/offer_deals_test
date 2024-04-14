import 'dart:developer';

import 'package:test_deals/res/api_url/api_urls.dart';

import '../data/network_services/network_api_services.dart';

class TopDealsRepository{
  final _networkApiServices = NetworkApiServices();

  Future<dynamic> topDealsAPICall() async {
    final response = await _networkApiServices.getAPI(AppApiURL.top_dealsAPI);
    log(response.toString());
    return response;
  }
}