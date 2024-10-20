import 'package:flutter/material.dart';

class ClearUploadButton extends StatelessWidget {
  final void Function() onPressed;
  const ClearUploadButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: WidgetStateProperty.all(Colors.black.withOpacity(0.7))
      ),
      child: const Icon(
        Icons.close,
        color: Colors.white,
        size: 20
      )
    );
  }
}