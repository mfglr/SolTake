import 'package:flutter/material.dart';

class PaginationLineWidget extends StatelessWidget {
  final double width;
  final int pageCount;
  final int initialPage;
  final double page;

  const PaginationLineWidget({
    super.key,
    required this.width,
    required this.pageCount,
    required this.initialPage,
    required this.page
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 3,
          width: width,
          child: Container(
            color: Colors.grey,
          ),
        ),
        Positioned(
          left: (width / pageCount) * page,
          child: Container(
            color: Colors.black,
            height: 6,
            width: (width / pageCount),
          ),
        )
      ],
    );
  }
}