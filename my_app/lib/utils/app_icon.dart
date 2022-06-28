import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {Key? key,
      required this.icon,
      this.size = 50,
      this.iconsize=30,
      required this.iconcolor,
      required this.bgcolor})
      : super(key: key);
  final double size;
  final Color iconcolor;
  final Color bgcolor;
  final IconData icon;
  final double iconsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(size / 2)),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconsize,
      ),
    );
  }
}
