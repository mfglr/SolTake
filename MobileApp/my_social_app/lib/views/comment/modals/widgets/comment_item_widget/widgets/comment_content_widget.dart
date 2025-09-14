import 'package:flutter/material.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_item_widget/widgets/comment_tag_widget.dart';

@immutable
class FormatedContent{
  final String text;
  final bool isUserName;
  const FormatedContent({required this.text, required this.isUserName});
}

class CommentContentWidget extends StatelessWidget {
  final CommentState comment;
  const CommentContentWidget({super.key,required this.comment});

  List<FormatedContent> formatContent(String content){
    List<FormatedContent> r = [];
    int i = 0;
    while(i < content.length){
      if(content[i] == "@"){
        String temp = "";
        i++;
        while(i < content.length && content[i] != "@" && content[i] != " "){
          temp += content[i];
          i++;
        }
        if(temp == ""){
          r.add(const FormatedContent(text: "@", isUserName: false));
        }
        r.add(FormatedContent(text: temp, isUserName: true));
      }else{
        String temp = "";
        while(i < content.length && content[i] != "@"){
          temp += content[i];
          i++;
        }
        r.add(FormatedContent(text: temp, isUserName: false));
      }
    }
    return r;  
  }
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: formatContent(comment.content).map((e){
        if(!e.isUserName){
          return Text(
            e.text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            )
          );
        }
        return CommentTagWidget(userName: e.text);
      }).toList()
    );
  }
}