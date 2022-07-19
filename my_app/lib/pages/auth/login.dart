import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/appcolors.dart';
 
import '../../utils/custom_widget.dart';
import '../../utils/text_field.dart';
import 'auth_btn.dart';
import 'login_animation.dart';
import 'sign_up.dart';
 
class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 190.0;
  double widthIcon = 200.0;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  getDisposeController() {
    email.clear();
    password.clear();
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDisposeController();
  }

  @override
  void dispose() {
    getDisposeController();
    // TODO: implement dispose
    super.dispose();
  }

  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

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
                      AppColors.colorPrimaryDark.withOpacity(0.7),
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
//                top: keyboardOpen ? -size.height / 3.2 : 0.0,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / (1.36),
                  color: AppColors.whiteColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (70)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/iconn.png',
                      height: 100,
                      width: 100,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (200)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Welcome Back !',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 24.0,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 22,
                  left: 22,
                  bottom: 22,
                  top: (270),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Email',
                        obscureText: false,
                        prefixIconData: Icons.mail_outline,
                        textEditingController: email,
                        focusNode: emailFocus, onChanged: (String s) { print("Login wtsup") ;},
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        textEditingController: password,
                        focusNode: passwordFocus, onChanged: (String s ) { print("hi whatsup") ;},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 18),
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(
                        top:40,
                        right: (8),
                        left: (8),
                        bottom: (20),
                      ),
                      child: AuthButton(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.whiteColor,
        height: 70,
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedContainer(
                  width: widthIcon,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      getAuth(
                        "assets/google.png",
                        margin: EdgeInsets.only(left: 30.0),
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
                    getDisposeController();
                   
                    Get.to(SignUpPage(),transition: Transition.fade);
                    setState(() {
                      width = 400.0;
                      widthIcon = 0;
                    });
                  },
                  child: AnimatedContainer(
                    height: 65.0,
                    width: width,
                    duration: Duration(milliseconds: 1000),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
//                          margin: EdgeInsets.only(right: 8,top: 15),
                                child: Text(
                                  "Not Yet Register ?",
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
                                  "Sign Up",
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
                      ],
                    ),
                    curve: Curves.linear,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: AppColors.colorPrimaryDark,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
