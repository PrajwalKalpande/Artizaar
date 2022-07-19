import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/artworks_for_sell_controller.dart';
import 'package:my_app/controllers/cart_controller.dart';
import 'package:my_app/pages/home/market.dart';
import 'package:my_app/routes/route_helper.dart';
import 'package:my_app/utils/back_icon.dart';
import 'package:my_app/utils/shop_icon.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/profile.dart';
import '../../utils/app_icon.dart';
import '../../utils/specs.dart';
import '../home/market.dart';
 
class DisplayArtSell extends StatefulWidget {
  int index;
 
   DisplayArtSell({Key? key,required this.index}) : super(key: key);

 
  
  @override
  State<DisplayArtSell> createState() => _DisplayArtSellState();
}

class _DisplayArtSellState extends State<DisplayArtSell> {

   final bidController = TextEditingController();
  int _bid = 0;
@override
 

  void dispose(){
    
   
    super.dispose();
    bidController.dispose();

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   
   
  }
   void getProfile() {print("Profile");}
  @override
     
  Widget build(BuildContext context) {
   final artwork = Get.find<ArtworksforSellController>().popularArtworks[widget.index];
    final cart  = Get.find<CartController>();
    return Container(
      child: Scaffold(
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

                        ),
                        child:Image.network(artwork.art.toString(),
                      
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Image(image: AssetImage("assets/imagenotfound.png"),);
                                }),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Container(
                                   
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
                                Text(artwork.username.toString(),
                                    style: GoogleFonts.workSans(
                                        fontSize: Dimensions.height25 * 0.8,
                                        color: AppColors.mainColor))])
                                ,
                                Container(
                                  
                                  child:IconButton(onPressed: ()=>{print("liked")},
                                 icon: Image.asset("assets/heart.png"),iconSize: 50,))
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
                                        value: "${artwork.size!.height} x ${artwork.size!.width} inches",
                                        textsize: Dimensions.height10 * 1.7,
                                      ),
                                      Spec(
                                        specification: "Material",
                                        value:artwork.material.toString(),
                                        textsize: Dimensions.height10 * 1.7,
                                      )
                                    ],
                                  ),
                                   
                                      Spec(
                                        specification: "Subject",
                                        value: artwork.details!.subject.toString(),
                                        textsize: Dimensions.height10 * 1.7,
                                      ),
                                      Spec(
                                        specification: "Medium",
                                        value: artwork.details!.medium.toString(),
                                        textsize: Dimensions.height10 * 1.7,
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
                                  value:"Rs. ${artwork.price}",
                                  textsize: Dimensions.height10 * 1.7,
                                ))),
                            Container(
                                margin: EdgeInsets.only(top: Dimensions.height10),
                                color: AppColors.black,
                                height: Dimensions.height25 * 2,
                                child: Spec(
                                    specification: artwork.forSell!? "Current Bid":"Sold For",
                                    value: "Rs. ${artwork.currentbid}",
                                    textsize: Dimensions.height10 * 2.5,
                                    color: AppColors.mainColor)),
                                     if(( _bid.toInt().isGreaterThan(0) )) Container(
                                        height: Dimensions.height25 * 2,
                                margin: EdgeInsets.only(top: Dimensions.height10),
                                color: AppColors.black,
                           
                                child: Spec(
                                    specification: "Your Bid",
                                    value: "Rs. ${_bid}",
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
                                          artwork.description.toString()
                                          ,
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
                        width: Dimensions.screenWidth,
                        padding: EdgeInsets.only(top: Dimensions.height10),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.height25),
                                topRight: Radius.circular(Dimensions.height25))),
                        child:  (artwork.forSell!) ?
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                
                                children: [Container(
                                  margin: EdgeInsets.only(left: Dimensions.width5*2),
                                  width:Dimensions.screenWidth/3,
                                  child: TextFormField(decoration: InputDecoration(border: UnderlineInputBorder(), hintText :"Enter amount(Rs.)",
                                  focusColor: AppColors.gold ),
                                  keyboardType: TextInputType.number,controller: bidController,
                                  ),
                                ),
                                   TextButton(
                                    child: Text("Place a Bid!",
                                        style: GoogleFonts.workSans(color: AppColors.black,
                                            fontSize: Dimensions.height25,fontWeight:FontWeight.w800)),
                                            onPressed: (){print("Offer Made"+bidController.text);
                                           
                                            cart.addItem(artwork,int.parse(bidController.text)) ? 
                                            setState(() { _bid = int.parse(bidController.text);}):
                                            _bid =0;

;
                                            bidController.text = "";
                                         
                                            return;
                                            },
                                   
                                )]):
                             
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[Center(child:Text("Sold!", style: GoogleFonts.workSans(color: AppColors.containerColor,
                                            fontSize: Dimensions.height25,fontWeight:FontWeight.w800)),)])
                             
                        ))
                                ,Positioned(
                    top: Dimensions.height10,
                    left: Dimensions.width5 * 1,
                    right: Dimensions.width5,
                   
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                             GestureDetector(
                              onTap:()=>{Get.toNamed(RouteHelper.initial)} ,
                               child: BackIcon(),
                             ) ,
                         GestureDetector(
                          onTap: ()=>Get.toNamed(RouteHelper.cart),
                          child: ShopIcon())
                        ],
                      ),
                    ),
                     
              ]),
            )),
      ),
    );
  }
}
 