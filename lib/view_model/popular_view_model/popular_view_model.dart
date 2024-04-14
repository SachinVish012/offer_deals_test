import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/top_model_class/top_model_class.dart';
import '../../repository/popular_featured_repo.dart';
import '../../utils/scroll_utils/load_data.dart';

class PopularViewModel extends GetxController {
  var deals = <Deal>[].obs;
  var isLoading = true.obs;
  ScrollController scrollController = ScrollController();
  PopularsRepository _popularsRepository = PopularsRepository();

  @override
  void onInit() async {
    scrollController.addListener(
            () => ScrollUtils.scrollListener(scrollController, loadMoreData));
    super.onInit();
  }

  //---fetch data from api
  Future<void> fetchData() async {
    try {
      isLoading(true);
      var value = await _popularsRepository.popularDealsAPICall();
      print(value.toString() + "--------");
      if (value != null) {
        final List<dynamic> dealsJson = value['deals'];
        List<Deal> fetchedDeals =
            dealsJson.map((dealJson) => Deal.fromJson(dealJson)).toList();
        deals.assignAll(fetchedDeals);
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');
    } finally {
      isLoading(false);
    }
  }
  void loadMoreData() {
    ScrollUtils.loadMoreData(() {
      print("Load More Data");
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

}
