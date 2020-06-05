import 'package:coronaapp/res/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingUi(){
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorUI(String message){
  return Center(
    child: Text(message,style:TextStyle(color:AppColors.red),),
  );
}