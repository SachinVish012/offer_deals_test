import 'package:get/get.dart';

import '../../model/top_model_class/top_model_class.dart';
import '../../repository/popular_featured_repo.dart';
import '../../res/pagignation/pagignation_class.dart';
import '../../utils/toast_msg/toast_msg.dart';

class PopularViewModel extends GetxController {
  var deals = <Deal>[].obs;
  var isLoading = true.obs;
  PopularsRepository _popularsRepository = PopularsRepository();
  final Pagination pagination = Pagination();


  //---fetch data from api
  Future<void> fetchData() async {
    try {
      isLoading(true);
      var value = await _popularsRepository.popularDealsAPICall();
      print(value.toString() + "--------");
      if (value != null) {
        final List<dynamic> dealsJson = value['deals'];
        List<Deal> fetchedDeals = dealsJson.map((dealJson) => Deal.fromJson(dealJson)).toList();
        if (pagination.currentPage == 1) {
          deals.assignAll(fetchedDeals);
        } else {
          deals.addAll(fetchedDeals);
        }
        pagination.currentPage++;
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');
    } finally {
      isLoading(false);
    }
  }
  //---for pagignation data load
  void loadMoreData() async {
    if (!isLoading.value && pagination.hasNextPage(deals)) {
      isLoading(true);
      await fetchData();
      isLoading(false);
    } else {
      toastRedC("No more data available");
    }
  }

}
