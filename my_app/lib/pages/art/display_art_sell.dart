import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/profile.dart';
import '../../utils/app_icon.dart';
import '../../utils/specs.dart';

class DisplayArtSell extends StatelessWidget {
  const DisplayArtSell({Key? key}) : super(key: key);
  void getProfile() {
    print("Profile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
          color: AppColors.black,
          width: double.maxFinite,
          child: SafeArea(
            child: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height25 * 15,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                        ),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/ironman.jpg"))),
                  )),
              Positioned(
                  top: Dimensions.height10,
                  left: Dimensions.width5 * 1,
                  right: Dimensions.width5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(
                        bgcolor: AppColors.lightPrimary,
                        iconcolor: AppColors.mainColor,
                        icon: Icons.arrow_back_ios_new_sharp,
                        size: Dimensions.height25 * 2,
                        iconsize: Dimensions.height10 * 3,
                      ),
                      AppIcon(
                          icon: Icons.shopping_bag_sharp,
                          iconcolor: AppColors.lightPrimary,
                          bgcolor: AppColors.mainColor,
                          iconsize: Dimensions.height10 * 3,
                          size: Dimensions.height10 * 5)
                    ],
                  )),
                  Container(
                    child: SingleChildScrollView(child:   
                  Container(
                    margin:EdgeInsets.only(top:375),
                      height: 600,
                      padding: EdgeInsets.only(
                          left: Dimensions.width5, right: Dimensions.width5),
                      decoration: BoxDecoration(
                        color: AppColors.bluePrimary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.height10 * 0.7,
                                      bottom: Dimensions.height10 * 0.7,
                                      right: Dimensions.width5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.mainColor,
                                  ),
                                  child: IconButton(
                                    onPressed: getProfile,
                                    icon: Icon(Icons.person_rounded,
                                        color: Color.fromARGB(255, 82, 6, 31)),
                                    splashColor:
                                        Color.fromARGB(97, 255, 255, 255),
                                  )),
                              Text("prajwalkalpande3",
                                  style: GoogleFonts.workSans(
                                      fontSize: Dimensions.height25 * 0.8,
                                      color: AppColors.mainColor))
                            ],
                          )),
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spec(
                                      specification: "Size",
                                      value: "18 x 24 inches",
                                      textsize: Dimensions.height10 * 1.7,
                                    ),
                                    Spec(
                                      specification: "Material",
                                      value: "Canvas",
                                      textsize: Dimensions.height10 * 1.7,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spec(
                                      specification: "Subject",
                                      value: "Nature",
                                      textsize: Dimensions.height10 * 1.7,
                                    ),
                                    Spec(
                                      specification: "Medium",
                                      value: "Oil Painting",
                                      textsize: Dimensions.height10 * 1.7,
                                    )
                                  ],
                                )
                              ])),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.height10),
                              decoration: BoxDecoration(
                                  // border: Border(
                                  //     bottom: BorderSide(
                                  //         width: 5,
                                  //         color: AppColors.dutchWhite)),
                                  ),
                              child: Center(
                                  child: Spec(
                                specification: "Price",
                                value: "Rs. 1000",
                                textsize: Dimensions.height10 * 1.7,
                              ))),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.height10),
                              color: AppColors.black,
                              height: Dimensions.height25 * 2,
                              child: Spec(
                                  specification: "Current Bid",
                                  value: "Rs. 700",
                                  textsize: Dimensions.height10 * 2.5,
                                  color: AppColors.mainColor)),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.height10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.height10 * 2,
                                        bottom: Dimensions.height10),
                                    child: Text(
                                      "Description",
                                      style: GoogleFonts.comfortaa(
                                          color: AppColors.dutchWhite),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                          style: GoogleFonts.workSans()))
                                ],
                              )),
                        ],
                      )),
             )),
             Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      height: 75,
                      padding: EdgeInsets.only(top: Dimensions.height10),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.height25),
                              topRight: Radius.circular(Dimensions.height25))),
                      child:  Center(
                              widthFactor: 0.8,
                              child: TextButton(
                                child: Text("Make a Bid!",
                                    style: GoogleFonts.workSans(color: AppColors.black,
                                        fontSize: Dimensions.height25,fontWeight:FontWeight.w800)),
                                        onPressed: ()=>{print("Offer Made")},
                              ))))
            ]),
          )),
    );
  }
}
