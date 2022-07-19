import 'package:flutter/material.dart';
import  'package:get/get.dart';
 
import 'package:google_fonts/google_fonts.dart';

import 'package:my_app/controllers/cart_controller.dart';
import 'package:my_app/utils/app_icon.dart';
import 'package:my_app/utils/back_icon.dart';
import 'package:my_app/utils/shop_icon.dart';
import 'package:my_app/utils/specs.dart';

import '../../routes/route_helper.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cart = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
     var items  = cart.getItems();
    return SafeArea (
      child: Container(
        color:AppColors.black,
          width: Dimensions.screenWidth,
        child:Column(children: [
          Container(
           
            child: Container(
             height:Dimensions.height10*5.3,
            width: Dimensions.screenWidth,
             
              child: Row(
                
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              BackIcon(),
             
                ShopIcon(),
                 AppIcon(  bgcolor: AppColors.lightPrimary,
                                    iconcolor: AppColors.mainColor,
                                    icon: Icons.home,
                                    size: Dimensions.height25 * 2,
                                    iconsize: Dimensions.height10 * 3,
                                                             ),
               
            ],)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container( 
              width: Dimensions.screenWidth,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:cart.totalItems,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()=>{Get.toNamed(RouteHelper.getPopularArtwork(index))},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width5 * 0.2,
                      
                            top: Dimensions.height10*0.5),
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(Dimensions.height10),
                        ),
                        height: Dimensions.height25*6,
                        width: Dimensions.screenWidth-1*Dimensions.width5*0.3,
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.width5 * 0.3,
                        ),
                            height: Dimensions.height25*7,
                            width: Dimensions.width25 * 5.5,
                            // color: Color.fromARGB(255, 149, 222, 115),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height10 * 1),
                                 
                          ), 
                          // child:Image.network("url",
                          
                          //           fit: BoxFit.contain,
                          //           errorBuilder: (context, error, stackTrace) {
                          //             return  Image(image: AssetImage("assets/imagenotfound.png"),);
                          //           }),
                          child:Image.network(items[index].art.toString(),
                      
                                fit: BoxFit.fitWidth,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Image(image: AssetImage("assets/imagenotfound.png"),);
                                }),
                                  
                          ),
                          Column(
                           
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Container(
                                    margin:EdgeInsets.only(top:Dimensions.height10),
                                  child:Text(items[index].title!,
                              
                                          style:  GoogleFonts.comfortaa(
                                            color: AppColors.gold,
                                                                         
                                            fontSize: Dimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w700,
                                            decoration: null,
                                       
                                          )))
                              ]),),
                              Container(height: Dimensions.height10*0.2, color: Color.fromARGB(191, 242, 238, 231), width: Dimensions.width25*9,),
                                 
                                  Text("${items[index].size!.height} x ${items[index].size!.width} inches",
 
          style: GoogleFonts.ubuntuMono(
              fontSize: Dimensions.height10*1.3, color: AppColors.dutchWhite),),
                                  
                                   Container(
                                 
                                    child:  Text(
 
          items[index].details!.subject.toString() +                            
         " | "+ items[index].material.toString(),
          style: GoogleFonts.ubuntuMono(
              fontSize: Dimensions.height10*1.3, color: AppColors.dutchWhite),),),

          
                                   Container(
               
                   child:  Text(
                
                                     
          items[index].details!.medium.toString(),
          style: GoogleFonts.ubuntuMono(
              fontSize: Dimensions.height10*1.3, color: AppColors.dutchWhite),)
      ),
                                 
 Container(height: Dimensions.height10*0.1, color:Color.fromARGB(255, 235, 189, 157), width: Dimensions.width25*10,),
  
                                 
                                
                               Container(child:
                               Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [Column(children: [Text("MAXIMUM BID",style:GoogleFonts.ptSansCaption( fontSize: Dimensions.height10*1.2, color: AppColors.dutchWhite),),
                                Container(color:Color.fromARGB(144, 242, 238, 231),
                                  child: Text("Rs.${items[index].maxbid}",style:GoogleFonts.ptSansCaption( fontSize: Dimensions.height10*1.3, color: AppColors.black),)),
                                ],),
                                Container(margin: EdgeInsets.only(left:Dimensions.width25*1.3),
                                  child: Column(children: [Text("YOUR BID",style:GoogleFonts.ptSansCaption( fontSize: Dimensions.height10*1.3, color: AppColors.highlight),),
                                  Container(
                                    color:Color.fromARGB(144, 242, 238, 231),
                                    child: Row(
                                      children: [
                                        Text("Rs.${items[index].userbid}",style:GoogleFonts.ptSansCaption( fontSize: Dimensions.height10*1.2, color: AppColors.black),),
                                        Icon(Icons.edit)
                                      ],
                                    ),
                                  ),])),],),

                               
                               )
                            ],
                          )
                         
                        ])
                        ,
                      ),
                    );
                  }
              ) ),
            ),
          )
       
        ],)
    
    
    
    
    
      ),
    );
  }
}