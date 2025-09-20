import 'package:flutter/material.dart';

extension ScrollControllerExtensions on ScrollController {
  void onScrollBottom(void Function() callback){
    if(hasClients && position.pixels == position.maxScrollExtent){
      callback();
    }
  }
}