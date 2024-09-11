import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ScrollToBottomButton extends StatelessWidget {
  final int numberOfNewMessages;
  final ScrollController scrollController;
  const ScrollToBottomButton({
    super.key,
    required this.numberOfNewMessages,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: (){
        scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.linear);
      },
      style: FilledButton.styleFrom(
        shape: const CircleBorder(),
      ),
      child: badges.Badge(
        badgeContent: Text(numberOfNewMessages.toString()),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.red,
        ),
        child: const Icon(Icons.keyboard_arrow_down_outlined),
      ),
    );
  }
}