import 'package:flutter/material.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';

class CommentTagWidget extends StatelessWidget {
  final String userName;
  const CommentTagWidget({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: null, userName: userName))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: const Icon(Icons.person,size: commentIconFontSize)
          ),
          Text(
            userName,
            style: const TextStyle(fontSize: commentContentFontSize),
          )
        ],
      )
    );
  }
}