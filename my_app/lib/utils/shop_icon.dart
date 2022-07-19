
import 'package:flutter/material.dart';
import './app_icon.dart';
import './dimensions.dart';
import './appcolors.dart';
class ShopIcon extends StatelessWidget {
  const ShopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:AppIcon(
                              icon: Icons.shopping_bag_sharp,
                              iconcolor: AppColors.lightPrimary,
                              bgcolor: Color.fromARGB(255, 59, 48, 31),
                              iconsize: Dimensions.height10 * 3,
                              size: Dimensions.height10 * 5));
  }
}