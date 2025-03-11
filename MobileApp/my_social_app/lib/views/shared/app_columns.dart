import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AppColumns extends StatelessWidget {
  final Iterable<Widget> children;
  const AppColumns({
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