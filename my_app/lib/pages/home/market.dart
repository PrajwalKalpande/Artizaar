import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import 'market_body.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.bluePrimary,
      body: SafeArea(
          child: Column(children: [
        Container(
            margin: EdgeInsets.only(bottom: Dimensions.height10 / 2),
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width5 * 2,
                    right: Dimensions.width5 * 2,
                    bottom: 3,
                    top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text("Artistagram",
                        style: GoogleFonts.workSans( 
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width5 * 5,
                        )),
                    Container(
                        width: 2 * Dimensions.width25,
                        height: 2 * Dimensions.height25,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height25),
                            color: AppColors.mainColor),
                        child: Icon(Icons.messenger_rounded,
                            color: AppColors.lightPrimary))
                  ],
                ))),
        Expanded(child: SingleChildScrollView(child: MarketBody())),
      ])),
    ));
  }
}
