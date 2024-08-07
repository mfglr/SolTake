import 'package:flutter/material.dart';

class NoSolutionsWidget extends StatelessWidget {
  final bool isOwner;
  const NoSolutionsWidget({super.key,required this.isOwner});

  @override
  Widget build(BuildContext context) {
    if(isOwner){
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oh No!!! No Solutions Yet!!!😢",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            Text(
              "Dont Worry! Your question will be solved soon.🤞",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30
              ),
            )
          ],
        ),
      );
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Solutions Yet!!!😢",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Text(
             "Be the first to solve this question.👍",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            ),
          )
        ],
      ),
    );
  }
}