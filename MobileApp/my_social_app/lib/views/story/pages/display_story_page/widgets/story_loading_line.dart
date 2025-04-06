import 'package:flutter/material.dart';

class StoryLoadingLine extends StatelessWidget {
  final int duration;
  final double height;
  final int activeIndex;
  final double rate;
  final int numberOfItems;
  final void Function() next;

  const StoryLoadingLine({
    super.key,
    this.duration = 15,
    this.activeIndex = 0,
    this.height = 6,
    required this.numberOfItems,
    required this.next,
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    final widthOfItem = (MediaQuery.of(context).size.width - (numberOfItems + 1) * 5) / numberOfItems;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children : 
        Iterable<int>
          .generate(numberOfItems)
          .map((index) => Stack(
            children: [
              Container(
                width: widthOfItem,
                height: height,
                color: Colors.grey,
              ),
              if(activeIndex == index)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: widthOfItem * rate,
                    height: height,
                    color: Colors.white,
                  )
                )
            ],
          ))
          .toList()
    );
  }
}