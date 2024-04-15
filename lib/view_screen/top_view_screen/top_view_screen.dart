import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_deals/utils/date_formate/date_formate.dart';
import '../../res/components/custom_widgets/custom_card_widget.dart';
import '../../utils/scroll_utils/load_data.dart';
import '../../view_model/top_view_model/top_view_model.dart';

class TopViewScreen extends StatefulWidget {
  const TopViewScreen({Key? key}) : super(key: key);

  @override
  State<TopViewScreen> createState() => _TopViewScreenState();
}

class _TopViewScreenState extends State<TopViewScreen> {
  final TopViewModel topViewModel = Get.put(TopViewModel());

  @override
  void initState() {
    topViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await topViewModel.fetchData();
        },
        child: Obx(() {
          if (topViewModel.isLoading.value && topViewModel.deals.isEmpty) {
            print("-----1-----");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: topViewModel.deals.length + (topViewModel.pagination.hasNextPage(topViewModel.deals) ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < topViewModel.deals.length) {
                  final deal = topViewModel.deals[index];
                  String formattedDate = DateFormateUtils.formatDate(deal.createdAt);
                  return DealCardWidget(
                    imageUrl: deal.imageMedium,
                    commentsCount: deal.commentsCount,
                    createdDate: formattedDate.toString(),
                  );
                } else {
                  topViewModel.loadMoreData();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            );
          }
        }),
      ),
    );
  }
}

