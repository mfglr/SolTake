import 'package:flutter/material.dart';

class ExtendableContent extends StatefulWidget {
  final String content;
  final int numberOfExtention;
  final TextStyle? textStyle;
  const ExtendableContent({
    super.key,
    required this.content,
    required this.numberOfExtention,
    this.textStyle
  });

  @override
  State<ExtendableContent> createState() => _ExtendableContentState();
}

class _ExtendableContentState extends State<ExtendableContent> {
  bool _isExtended = false;

  String _formatContent(String content) =>
    content.length <= widget.numberOfExtention ? content : "${content.substring(0,widget.numberOfExtention - 3)}...";

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
          if(_isExtended){
            return SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 5,
              child: SingleChildScrollView(
                child: Text(
                  widget.content,
                  style: widget.textStyle,
                ),
              ),
            );
          }
          return Text(
            _formatContent(widget.content),
            style: widget.textStyle,
          );
        },
      )
    );
  }
}