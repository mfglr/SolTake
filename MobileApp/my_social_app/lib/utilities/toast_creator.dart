import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastCreator{
  static void displaySuccess(String message){
    toastification.dismissAll();
    toastification.show(
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: AlignmentDirectional.bottomCenter,
      backgroundColor: Colors.green,
    );
  }

  static void displayError(String message,{int? length}){
    toastification.dismissAll();
    toastification.show(
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: AlignmentDirectional.bottomCenter,
      backgroundColor: Colors.red,
    );
  }
}