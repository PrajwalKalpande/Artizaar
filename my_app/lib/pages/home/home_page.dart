import 'package:flutter/material.dart';
import 'package:my_app/pages/auth/sign_up.dart';
import 'package:my_app/pages/cart/cart_page.dart';
import 'package:my_app/pages/home/market.dart';
import 'package:my_app/utils/appcolors.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../auth/login.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<Widget> _buildScreens() {
        return [
          Market(),SignUpPage(),Container(child:Text("Add Items")),CartScreen(),Login()
        ];
    }
 

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                // title: ("Home"),
                activeColorPrimary: AppColors.gold ,
                
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.explore),
                // title: ("Home"),
            
                activeColorPrimary: AppColors.gold ,
              
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.add_circle),
                // title: ("Home"),
                 iconSize: 40,
                activeColorPrimary:Color.fromARGB(190, 16, 9, 53),
                 activeColorSecondary: AppColors.gold,
                
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.shopping_bag),
                // title: ("Home"),
                activeColorPrimary: AppColors.gold ,
              
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.person),
                // title: ("Home"),
                 
                activeColorPrimary: AppColors.gold ,
               
            ),
      
        ];
    }

late PersistentTabController _controller;
@override
void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  // void onTapNav(int index){
  //   setState(() {
  //     _currentPage = index;
  //   });
  // }
  @override
  // Widget build(BuildContext context) {
  //     return Scaffold(body: pages[_currentPage],
  //       extendBody: true,
  //        extendBodyBehindAppBar: true,
  //     backgroundColor: AppColors.black,
     
  //     bottomNavigationBar:BottomNavigationBar(
  //        backgroundColor: Colors.transparent,
  //       selectedItemColor: AppColors.gold,
  //       elevation: 0,
  //       unselectedItemColor: AppColors.mainColor,
  //       showSelectedLabels: false,
  //       onTap: onTapNav,
  //       items: [BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
  //     BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: "Explore"),
  //     BottomNavigationBarItem(icon: Icon(Icons.add_circle),label:"Create"),
  //     BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label:"Cart"),
  //     BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile")]) ,);
      
  // }
 
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarHeight: Dimensions.height10*6.6,
        confineInSafeArea: true,
        
        backgroundColor: Colors.transparent, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
         colorBehindNavBar: Color.fromARGB(187, 28, 21, 62)
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}