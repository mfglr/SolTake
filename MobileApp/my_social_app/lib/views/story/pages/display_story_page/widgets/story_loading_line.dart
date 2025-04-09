import 'package:flutter/material.dart';

class StoryLoadingLine extends StatelessWidget {
  final int duration;
  final double height;
  final int activeIndex;
  final double rate;
  final int numberOfItems;

  const StoryLoadingLine({
    super.key,
    this.duration = 15,
    this.activeIndex = 0,
    this.height = 4,
    required this.numberOfItems,
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    final widthOfItem = (MediaQuery.of(context).size.width - ((numberOfItems + 1) * 1)) / numberOfItems;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children :
          Iterable<int>
            .generate(numberOfItems)
            .map((index) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                    borderRadius: BorderRadius.all(Radius.circular(height / 2)) 
                  ),
                  width: widthOfItem,
                  height: height,
                ),
                if(index == activeIndex)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(155),
                      borderRadius: BorderRadius.all(Radius.circular(height / 2)) 
                    ),
                    width: widthOfItem * rate,
                    height: height,
                  ),
              ],
            ))
            .toList()
      ),
    );
  }
}