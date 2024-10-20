import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_item_widget.dart';

class CirclePaginationWidget extends StatelessWidget {
  final int numberOfCircles;
  final int activeIndex;
  final Color activeColor;
  final Color passiveColor;
  final double diameter;
  final void Function(int) changeActiveIndex;
  const CirclePaginationWidget({
    super.key,
    required this.numberOfCircles,
    required this.changeActiveIndex,
    required this.activeIndex,
    this.activeColor = Colors.blue,
    this.passiveColor = Colors.grey,
    this.diameter = 6
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numberOfCircles,
        (index){
          if(index != numberOfCircles - 1){
            return Container(
              margin: const EdgeInsets.only(right: 4),
              child: CirclePaginationItemWidget(
                activeColor: activeColor,
                passiveColor: passiveColor,
                diameter: diameter,
                isActive: activeIndex == index,
                index: index,
                changeActiveIndex: changeActiveIndex
              ),
            );
          }
          return CirclePaginationItemWidget(
            activeColor: activeColor,
            passiveColor: passiveColor,
            diameter: diameter,
            isActive: activeIndex == index,
            index: index,
            changeActiveIndex: changeActiveIndex
          );
        }
      ),
    );
  }
}