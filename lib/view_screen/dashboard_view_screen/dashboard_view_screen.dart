import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_deals/utils/toast_msg/toast_msg.dart';
import '../../res/app_colors/app_colors.dart';
import '../../view_model/dashboard_view_model/dashboard_view_model.dart';
import '../featured_view_screen/featured_view_screen.dart';
import '../popular_view_screen/popular_view_screen.dart';
import '../top_view_screen/top_view_screen.dart';
import 'dashboard_widget/deals_widget.dart';
import 'dashboard_widget/menu_widget.dart';
import 'dashboard_widget/search_icon_widget.dart';

class DashboardViewScreen extends StatefulWidget {
  const DashboardViewScreen({Key? key}) : super(key: key);

  @override
  State<DashboardViewScreen> createState() => _DashboardViewScreenState();
}

class _DashboardViewScreenState extends State<DashboardViewScreen>
    with SingleTickerProviderStateMixin {

  final DashboardViewModel controller = Get.put(DashboardViewModel());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toastGreen("Tapped on Float Button");
        },
        backgroundColor: AppColors.red_color,
        foregroundColor: AppColors.white_text,
        shape: CircleBorder(),
        child: Icon(Icons.currency_rupee),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white_text),
        backgroundColor: Colors.blue,
        title: DealsTitleWidget(),
        actions: [
          //----search widget
          SearchIconWidget()
        ],
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {
            print(value.toString());
            controller.changeTabIndex(value);
          },
          indicatorColor: Colors.red,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(text: 'top'.tr),
            Tab(text: 'popular'.tr),
            Tab(text: 'featured'.tr),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Item1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [TopViewScreen(), PopularViewScreen(), FeaturedViewScreen()],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
