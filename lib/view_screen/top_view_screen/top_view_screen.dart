import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_deals/utils/date_formate/date_formate.dart';
import '../../res/components/custom_widgets/custom_card_widget.dart';
import '../../utils/scroll_utils/load_data.dart';
import '../../view_model/top_view_model/top_view_model.dart';

class TopViewScreen extends StatefulWidget {
  const TopViewScreen({super.key});

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
        onRefresh: () async{
          await topViewModel.fetchData();
        },
        child: Obx(() {
          if (topViewModel.deals.isEmpty && topViewModel.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
             controller: topViewModel.scrollController,
              itemCount: topViewModel.deals.length,
              itemBuilder: (context, index) {
                final deal = topViewModel.deals[index];
                String formattedDate = DateFormateUtils.formatDate(deal.createdAt);
                return DealCardWidget(
                  imageUrl: deal.imageMedium,
                  commentsCount: deal.commentsCount,
                  createdDate: formattedDate.toString(),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
