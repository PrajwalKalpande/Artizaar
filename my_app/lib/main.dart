import 'package:flutter/material.dart';
import 'package:my_app/controllers/artworks_for_sell_controller.dart';
import 'package:my_app/pages/auth/sign_up.dart';
import 'package:my_app/pages/home/home_page.dart';
import 'package:my_app/routes/route_helper.dart';
import 'package:my_app/utils/appcolors.dart';
import './pages/home/market.dart';
import 'package:get/get.dart';
import './pages/art/display_art_sell.dart';
import './helper/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  Get.find<ArtworksforSellController>().getPopularArtworksList();

  runApp(MyApp());
}

 


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
 
  Widget build(BuildContext context) {
     
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: AppColors.lightPrimary),
          bodyText2: TextStyle(color: AppColors.lightSecondary),
        ).apply(
          bodyColor: AppColors.lightPrimary,
          displayColor: AppColors.lightSecondary,
        ),
      ),
      home: SignUpPage(),
      initialRoute:RouteHelper.initial,
      getPages: RouteHelper.routes,
      
    );
  }
}
