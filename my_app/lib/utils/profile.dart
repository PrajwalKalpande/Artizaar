import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  final Icon picture;
  final String username;
  final VoidCallback onClick;
  final Color bgcolor;
  const Profile({
    Key? key,
    required this.picture,
    required this.username,
    required this.onClick,
    this.bgcolor=AppColors.bluePrimary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   void getProfile(){
    print("Profile needed");
   }
    return   Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.height10 * 0.7,
                                      bottom: Dimensions.height10 * 0.7,
                                      right: Dimensions.width5*1),
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
                                      fontSize: Dimensions.height25 * 0.6,
                                      color: AppColors.mainColor))
                            ],
                          );
  }
}
