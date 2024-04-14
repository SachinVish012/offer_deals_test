import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/app_colors/app_colors.dart';
import '../../../res/components/custom_widgets/custom_text_widgets.dart';

class DealsTitleWidget extends StatelessWidget {
  const DealsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text: 'deals_title'.tr,
      fontSize: 22,
      textColor: AppColors.white_text,
    );
  }
}
