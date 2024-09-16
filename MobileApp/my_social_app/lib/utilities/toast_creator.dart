import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastCreator{
  static void displaySuccess(String message){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  static void displayError(String message,{Toast? length}){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: length ?? Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

}