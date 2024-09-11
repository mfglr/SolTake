import 'package:flutter/material.dart';

class AppBackButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final Color? color;
  final double? size;
  const AppBackButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(onPressed != null){
          onPressed!();
        }
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back,
        color: color,
        size: size,
      ),
    );
  }
}