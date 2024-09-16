import 'package:flutter/material.dart';

class ExtendableContent extends StatefulWidget {
  final String content;
  final int numberOfExtention;
  const ExtendableContent({
    super.key,
    required this.content,
    required this.numberOfExtention
  });

  @override
  State<ExtendableContent> createState() => _ExtendableContentState();
}

class _ExtendableContentState extends State<ExtendableContent> {
  bool _isExtended = false;

  String _formatContent(String content) =>
    content.length <= widget.numberOfExtention ? content : "${content.substring(1,widget.numberOfExtention - 3)}...";

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => setState(() { _isExtended = !_isExtended; }),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Builder(
        builder: (context){
          if(_isExtended) return Text(widget.content);
          return Text(_formatContent(widget.content));
        },
      )
    );
  }
}