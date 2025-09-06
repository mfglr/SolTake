import 'package:flutter/material.dart';

void onScrollBottom(ScrollController controller, void Function() callback){
  if(controller.hasClients && controller.position.pixels == controller.position.maxScrollExtent){
    callback();
  }
}