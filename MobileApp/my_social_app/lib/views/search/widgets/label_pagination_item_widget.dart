import 'package:flutter/material.dart';

class LabelPaginationItemWidget extends StatelessWidget {
  final String label;
  final int countOfLabel;
  final bool isActive;
  final PageController pageController;
  final int index;
  final double width;

  const LabelPaginationItemWidget({
    super.key,
    required this.label,
    required this.countOfLabel,
    required this.isActive,
    required this.pageController,
    required this.index,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.black : Colors.grey;
    return TextButton(
      onPressed:(){
        if(pageController.hasClients){
          pageController.animateTo(
            ( width / countOfLabel ) * index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear
          );
        }
      },
      child: Text(
        label,
        style: TextStyle(color: color),
      )
    );
  }
}