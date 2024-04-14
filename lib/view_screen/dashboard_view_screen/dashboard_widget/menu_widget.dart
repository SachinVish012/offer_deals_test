import 'package:flutter/material.dart';
import 'package:test_deals/res/app_colors/app_colors.dart';

import '../../../res/components/custom_widgets/custom_icon_button.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: (){
        Scaffold.of(context).openDrawer();
      },
      iconData: Icons.menu,
      iconColor: AppColors.white_text,
    );
  }
}
