import 'package:flutter/material.dart';
import 'package:test_deals/res/app_colors/app_colors.dart';
import 'package:test_deals/utils/toast_msg/toast_msg.dart';

import '../../../res/components/custom_widgets/custom_icon_button.dart';

class SearchIconWidget extends StatelessWidget {
  const SearchIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child:
      CustomIconButton(
        onPressed: (){
          toastGreen("Tapped on Search Icon");
        },
        iconData: Icons.search,
        iconColor: AppColors.white_text,
      ),
    );
  }
}
