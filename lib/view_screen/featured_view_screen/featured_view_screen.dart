import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../res/components/custom_widgets/custom_card_widget.dart';
import '../../utils/date_formate/date_formate.dart';
import '../../view_model/popular_view_model/popular_view_model.dart';

class FeaturedViewScreen extends StatefulWidget {
  const FeaturedViewScreen({super.key});

  @override
  State<FeaturedViewScreen> createState() => _FeaturedViewScreenState();
}

class _FeaturedViewScreenState extends State<FeaturedViewScreen> {
  final PopularViewModel popularViewModel = Get.put(PopularViewModel());

  @override
  void initState() {
    popularViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await popularViewModel.fetchData();
        },
        child: Obx(() {
          if (popularViewModel.isLoading.value &&
              popularViewModel.deals.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: popularViewModel.deals.length +
                  (popularViewModel.pagination
                          .hasNextPage(popularViewModel.deals)
                      ? 1
                      : 0),
              itemBuilder: (context, index) {
                if (index < popularViewModel.deals.length) {
                  final deal = popularViewModel.deals[index];
                  String formattedDate =
                      DateFormateUtils.formatDate(deal.createdAt);
                  return DealCardWidget(
                    imageUrl: deal.imageMedium,
                    commentsCount: deal.commentsCount,
                    createdDate: formattedDate.toString(),
                  );
                } else {
                  popularViewModel.loadMoreData();
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
