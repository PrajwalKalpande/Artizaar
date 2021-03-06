import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class Spec extends StatelessWidget {
  const Spec(
      {Key? key,
      required this.specification,
      required this.value,
      this.margintop=1,
      this.textsize = 17,this.color=AppColors.highlight})
      : super(key: key);
  final String specification;
  final Color color;
  final double margintop;
  final String value;
  final double textsize;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(
          top: Dimensions.height10*margintop, bottom: Dimensions.height10 * 0.05),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          specification + " : ",
          style: GoogleFonts.ubuntuMono(fontSize: textsize),
        ),
        Text(
          value,
          style: GoogleFonts.ubuntuMono(
              fontSize: textsize, color: color),
        )
      ]),
    );
  }
}
