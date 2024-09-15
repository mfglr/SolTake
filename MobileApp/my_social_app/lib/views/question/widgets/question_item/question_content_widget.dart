import 'package:flutter/material.dart';

class QuestionContentWidget extends StatefulWidget {
  final String content;
  const QuestionContentWidget({
    super.key,
    required this.content
  });

  @override
  State<QuestionContentWidget> createState() => _QuestionContentWidgetState();
}

class _QuestionContentWidgetState extends State<QuestionContentWidget> {
  bool _isExtended = false;
  String _formatContent(int count){
    return widget.content.length <= count ? widget.content : "${widget.content.substring(0,count - 3)}...";
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => setState(() { _isExtended = true; }),
      child: Builder(
        builder: (context){
          if(!_isExtended){
            return Text(_formatContent(15));
          }
          else{
            return Text(widget.content);
          }
        }
      )
    );
  }
}