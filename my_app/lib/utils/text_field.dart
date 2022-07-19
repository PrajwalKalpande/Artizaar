import 'package:flutter/material.dart';
import 'package:my_app/utils/appcolors.dart';

 
class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
 
  final bool obscureText;
  final Function(String)? onChanged;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  TextFieldWidget({
    this.hintText = "Field Label",
    this.prefixIconData = Icons.abc,
   
    this.obscureText = false,
    required this.onChanged ,
    required this.textEditingController,
    required this.focusNode  ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: textEditingController,
      cursorColor: AppColors.colorPrimary,
      focusNode:  focusNode,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: AppColors.whiteColor),
        focusColor: AppColors.whiteColor,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
        labelText: hintText,
        hintStyle: TextStyle(color: AppColors.colorPrimary, fontSize: 14),
        prefixIcon: Icon(
          prefixIconData,
          size: 20,
          color: AppColors.whiteColor,
        ),
        
      ),
    );
  }
}