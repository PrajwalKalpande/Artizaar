// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/utils/profile.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/dimensions.dart';
class SellArtworks extends StatefulWidget {
  SellArtworks({Key? key}) : super(key: key);

  @override
  State<SellArtworks> createState() => _SellArtworksState();
}

class _SellArtworksState extends State<SellArtworks> {
  @override
  Widget build(BuildContext context) {
    void getProfile() {
      print("Display Profile");
    }

    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width5 * 2,
                    right: Dimensions.width5 * 2,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(Dimensions.height25),
                ),
                height: Dimensions.height25*6,
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width5 * 3,
                        right: Dimensions.width5 * 0.5),
                    height: Dimensions.height25*6,
                    width: Dimensions.width25 * 5,
                    // color: Color.fromARGB(255, 149, 222, 115),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height10 * 1.5),
                        image: DecorationImage(
                            image: AssetImage("assets/italy.jpg"),
                            fit: BoxFit.contain)),
                  ),
                  Container(
                    width: Dimensions.screenWidth * 0.48,
                    decoration: BoxDecoration(
                     
                      // borderRadius: BorderRadius.only(topRight:  Radius.circular(Dimensions.height10),
                    ),
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Profile(picture:Icon(Icons.person_rounded),username:"prajwalkalpande3", onClick:getProfile),
                         
                          Container(
                              margin:
                                  EdgeInsets.only(left: Dimensions.width5 * 2),
                              
                              width: double.infinity,
                              child: Text("Village in Italyfewfweffefef",
                                  style:  GoogleFonts.comfortaa(                                   
                                    fontSize: Dimensions.height10 * 2,
                                    fontWeight: FontWeight.w700,
                                  ))),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.width5 * 2,
                                  top: Dimensions.height10,
                                  bottom: Dimensions.height10 * 1.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price: Rs.500",
                                    style: GoogleFonts.ubuntuMono(
                                        fontSize: Dimensions.height10 * 1.3),
                                  ),
                                  Text(
                                    "Oil Painting",
                                    style: GoogleFonts.ubuntuMono(
                                        color:AppColors.highlight,
                                        fontSize: Dimensions.height10 * 1.3),
                                  )
                                ],
                              ))
                        ])),
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: Dimensions.height10 * 2.7,
                              margin: EdgeInsets.only(top: Dimensions.height10),
                              width: Dimensions.width5 * 8,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Image.asset('assets/heart.png'),
                                onPressed: () {},
                                 splashColor: Color.fromARGB(255, 233, 131, 131),
                              ))
                        ]),
                  )
                ]),
              );
            }));
  }
}
