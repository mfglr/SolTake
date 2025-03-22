import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MessageConnectionLoadingWidget extends StatelessWidget {
  const MessageConnectionLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 13,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
              ),
            )
          ]
        )
      ],
    );
  }
}