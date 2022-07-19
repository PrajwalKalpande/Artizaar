import 'package:flutter/material.dart';

import 'app_icon.dart';
import 'appcolors.dart';
import 'dimensions.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:AppIcon(
                                 
                                bgcolor: AppColors.lightPrimary,
                                iconcolor: AppColors.mainColor,
                                icon: Icons.arrow_back_ios_new_sharp,
                                size: Dimensions.height25 * 2,
                                iconsize: Dimensions.height10 * 3,
                                                         
                                                       ));
  }
}