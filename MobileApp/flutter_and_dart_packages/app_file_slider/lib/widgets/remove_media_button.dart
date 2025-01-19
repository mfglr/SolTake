import 'package:flutter/material.dart';

class RemoveMediaButton extends StatelessWidget {
  final void Function() onPressed;
  const RemoveMediaButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(153),
        shape: BoxShape.circle
      ),
      child: IconButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.all(3)),
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: Icon(
          Icons.clear,
          color: Colors.white,
          size: 30,
        )
      ),
    );
  }
}