import 'package:flutter/material.dart';

class LabelPaginationItemWidget extends StatelessWidget {
  final Widget Function(bool) labelBuilder;
  final bool isActive;
  final PageController pageController;
  final int index;

  const LabelPaginationItemWidget({
    super.key,
    required this.labelBuilder,
    required this.isActive,
    required this.pageController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:(){
        if(pageController.hasClients){
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear
          );
        }
      },
      child: labelBuilder(isActive)
    );
  }
}