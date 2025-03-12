import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final Iterable<Widget> children;
  const AppColumn({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        children
          .mapIndexed(
            (index,child) => 
              index == children.length - 1
                ? child
                : Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: child,
                  )
          )
          .toList(),
    );
  }
}