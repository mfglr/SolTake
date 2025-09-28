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

  bool get _isExtendable => widget.content.length > widget.numberOfExtention;

  void _onTap() => setState(() { _isExtended = !_isExtended; });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(!_isExtendable){
          return Text(
            widget.content,
            style: widget.textStyle,
          ); 
        }

        if(_isExtended){
          return LayoutBuilder(
            builder: (context, constraints) => GestureDetector(
              onTap: _onTap,
              child: SizedBox(
                height: constraints.constrainHeight(),
                width: constraints.constrainWidth(),
                child: SingleChildScrollView(
                  child: Text(
                    widget.content,
                    style: widget.textStyle,
                  ),
                ),
              ),
            ),
          );
        }
        return TextButton(
          onPressed: _onTap,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            _formatContent(widget.content),
            style: widget.textStyle,
          ),
        );
      },
    );
  }
}