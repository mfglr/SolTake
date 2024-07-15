import 'package:flutter/material.dart';

class AppBackButtonWidget extends StatelessWidget {
  final Function? onPressed;
  const AppBackButtonWidget({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(onPressed != null){
          onPressed!();
        }
        Navigator.of(context).pop();
      },
      child: const Icon(Icons.arrow_back),
    );
  }
}