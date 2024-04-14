import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_deals/repository/top_deals_repo.dart';
import 'package:test_deals/utils/toast_msg/toast_msg.dart';

import '../../model/top_model_class/top_model_class.dart';
import '../../utils/scroll_utils/load_data.dart';

class TopViewModel extends GetxController {
  var deals = <Deal>[].obs;
  var isLoading = true.obs;
  ScrollController scrollController = ScrollController();
  TopDealsRepository _topDealsRepository = TopDealsRepository();

  @override
  void onInit() async {
    fetchData();
    scrollController.addListener(
        () => ScrollUtils.scrollListener(scrollController, loadMoreData));
    super.onInit();
  }

  //----for api call
  Future<void> fetchData() async {
    try {
      isLoading(true);
      var value = await _topDealsRepository.topDealsAPICall();
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
      toastRedC("Data Not Available");
    });
  }

  @override
  void onClose() {
    deals.clear();
    scrollController.dispose();
    super.onClose();
  }
}
