// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:my_app/pages/home/market_sell.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import './market_sell.dart';

class MarketBody extends StatefulWidget {
  MarketBody({Key? key}) : super(key: key);

  @override
  State<MarketBody> createState() => _MarketBodyState();
}

class _MarketBodyState extends State<MarketBody> {
  PageController _pageController = PageController(viewportFraction: 0.88);
  double _height = Dimensions.pageViewContainer;
  var _curPageValue = 0.0;
  double _scaleFactor = 0.8;
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQuery.of(context).size.width);
    return  Container(
     
      child:Column(
      children: [
        Container(
            height: Dimensions.infopage,
            child: PageView.builder(
                controller: _pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                })),
        DotsIndicator(
          dotsCount: 5,
          position: _curPageValue,
          decorator: DotsDecorator(
              color: AppColors.black, // Inactive color
              activeColor: AppColors.mainColor,
              size: Size.square(6),
              activeSize: Size.square(10)),
        ),
        SizedBox(height: Dimensions.height10*1.5),
        Container(
            margin: EdgeInsets.only(
                left: Dimensions.width5 * 1.5, right: Dimensions.width5 * 1.5),
            child: Column(children: [
              Row(
                children: [
                  Text("Popular Artworks on Sale",
                      style: GoogleFonts.workSans(
                       
                        fontSize: Dimensions.width5*4,
                      )),
                ],
              ),
              // SizedBox(
              //     height: Dimensions.height10 / 3,
              //     child: Container(
              //       color: Color.fromARGB(234, 178, 108, 240),
              //     ))
            ])),
             SellArtworks(),
        
      ],
    ));
  }

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() => {
          setState(() {
            _curPageValue = _pageController.page!;
            // print(_curPageValue);
          })
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      var curScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var offset = (1 - curScale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, offset, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var curScale =
          _scaleFactor + (-index + _curPageValue + 1) * (1 - _scaleFactor);
      var offset = (1 - curScale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, offset, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var curScale =
          _scaleFactor + (index - _curPageValue + 1) * (1 - _scaleFactor);
      var offset = (1 - curScale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, offset, 0);
    } else {
      matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimensions.width5, right: Dimensions.width5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/car.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(Dimensions.height25),
                  color: index.isEven
                      ? Color.fromARGB(255, 247, 172, 60)
                      : Color.fromARGB(255, 42, 163, 208)),
            ),
          ],
        ));
  }
}
