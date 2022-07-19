// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:my_app/controllers/artworks_for_sell_controller.dart'; 
import 'package:flutter/material.dart';
import 'package:my_app/pages/art/display_art_sell.dart';
import 'package:my_app/pages/home/market.dart';
import 'package:my_app/routes/route_helper.dart';
import 'package:my_app/utils/appconstants.dart';
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
        child: GetBuilder<ArtworksforSellController>(builder: (popularArtworksController) {
          return  ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularArtworksController.popularArtworks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()=>{Get.toNamed(RouteHelper.getPopularArtwork(index))},
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width5 * 2,
                        right: Dimensions.width5 * 2,
                        top: Dimensions.height10),
                    decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(Dimensions.height25),
                    ),
                    height: Dimensions.height25*6,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
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
                             
                      ), 
                      child:Image.network(popularArtworksController.popularArtworks[index].art.toString(),
                      
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Image(image: AssetImage("assets/imagenotfound.png"),);
                                }),
                              
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
                              Profile(picture:Icon(Icons.person_rounded),username:popularArtworksController.popularArtworks[index].username.toString(), onClick:getProfile),
                             
                              Container(
                                  margin:
                                      EdgeInsets.only(left: Dimensions.width5 * 2),
                                  
                                  width: double.infinity,
                                  child: Text(popularArtworksController.popularArtworks[index].title.toString(),
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
                                        "Price: Rs."+popularArtworksController.popularArtworks[index].price.toString(),
                                        style: GoogleFonts.ubuntuMono(
                                            fontSize: Dimensions.height10 * 1.3),
                                      ),
                                      Text(
                                        popularArtworksController.popularArtworks[index].details!.subject.toString(),
                                        style: GoogleFonts.ubuntuMono(
                                            color:AppColors.highlight,
                                            fontSize: Dimensions.height10 * 1.3),
                                      )
                                    ],
                                  ))
                            ])),
                      ),
                      Container(margin: EdgeInsets.only(top:0),
                     
                         width: Dimensions.width5*8,
                    
                        child:IconButton(onPressed: ()=>{print("liked")}, icon: ImageIcon(AssetImage("assets/heart.png"),
                      size:50 ,color:Colors.red
                      )),
                      ),
                     
                    ])
                    ,
                  ),
                );
              }
          );
        }),);
  }
}
