 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/appcolors.dart';
import 'package:my_app/utils/dimensions.dart';
 
import '../../utils/custom_widget.dart';
import '../../utils/text_field.dart';
import 'login.dart';
import 'login_animation.dart';
 
class SignUpPage extends StatefulWidget {


  @override
  SignUpPageState createState() {
    return new SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
 
  double widthIcon = Dimensions.width25*8;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  FocusNode nameFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(),
                height: size.height,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      AppColors.colorPrimaryDark.withOpacity(0.8),
                      AppColors.colorPrimary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / 1.26,
                  color: AppColors.black,
                ),
              ),
              Positioned(
                top: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/iconn.png',
                      height: 120,
                      width: 120,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
             
              Positioned(
              
                
                  right: 22,
                  left: 22,
                  bottom: 22,
                  top: 220,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Name',
                        obscureText: false,
                        prefixIconData: Icons.account_circle,
                        textEditingController: name,
                        focusNode: nameFocus, onChanged: (String ) {  },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Email',
                        obscureText: false,
                        prefixIconData: Icons.email,
                        textEditingController: email,
                        focusNode: emailFocus, onChanged: (String ) {  },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        focusNode: passwordFocus,
                        textEditingController: password, onChanged: (String ) {  },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                       Get.to(Login(),transition: Transition.fade);
                      },
                      child: Container(
                         
                        margin: EdgeInsets.only(
                          top: (30),
                          right: (8),
                          left: (8),
                          bottom: (0),
                        ),
                        height: (Dimensions.height10*6),
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              AppColors.whiteColor,
                              AppColors.whiteColor.withOpacity(0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.colorPrimary.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 20,
                              // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            width: 2,
                            color: AppColors
                                .colorPrimaryDark, //                   <--- border width here
                          ),
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              (22.0),
                            ),
                          ),
                        ),
                        child: Container(
//                        margin: EdgeInsets.only(left: (10)),
                          alignment: Alignment.center,
                          child: Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: AppColors.colorPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned( 
               top:Dimensions.screenHeight-230 ,
                left:Dimensions.width25*4,
             height: Dimensions.height10*17,
                child: Container(
               
                  child: Center(
                   
                       
                        child: Column(
                          children: <Widget>[
                            Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Container(
                      width: widthIcon,
                    margin: EdgeInsets.only(bottom:40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          getAuth(
                            "assets/google.png",
                            margin: EdgeInsets.only(left: 35),
                          ),
                          getAuth(
                            "assets/facebook.png",
                            margin: EdgeInsets.only(right: 30.0),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Login(),transition: Transition.fade);
                        
                      },
                      child: Container(
                        height: 65.0,
                               decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(const Radius.circular(40) ),
                           color: Colors.amber,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                            width: 225,
                            
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                       margin: EdgeInsets.only(left:10),
                                    child: Text(
                                      "Already have an Account?",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1,
                                        color:
                                            AppColors.whiteColor.withOpacity(0.9),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
              //                          margin: EdgeInsets.only(right: 8,top: 15),
                                    child: Text(
                                      "Sign In",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        color:
                                            AppColors.whiteColor.withOpacity(0.9),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                               
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                   
                      ),
                    ),
                   
                  ],
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
 

//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//      floatingActionButton: FloatingActionButton.extended(
//
//          icon: Icon(Icons.update),
//          label: Text("Transform")),
    );
  }
}