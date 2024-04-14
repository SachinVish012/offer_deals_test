import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/custom_widgets/custom_card_widget.dart';
import '../../utils/date_formate/date_formate.dart';
import '../../view_model/popular_view_model/popular_view_model.dart';

class PopularViewScreen extends StatefulWidget {
  const PopularViewScreen({super.key});

  @override
  State<PopularViewScreen> createState() => _PopularViewScreenState();
}

class _PopularViewScreenState extends State<PopularViewScreen> {
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
        onRefresh: ()async{
          await popularViewModel.fetchData();
        },
        child: Obx(() {
          if (popularViewModel.deals.isEmpty && popularViewModel.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              controller: popularViewModel.scrollController,
              itemCount: popularViewModel.deals.length,
              itemBuilder: (context, index) {
                final deal = popularViewModel.deals[index];
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
