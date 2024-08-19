import 'package:flutter/material.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class CommentTagWidget extends StatelessWidget {
  final String userName;
  const CommentTagWidget({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: null, userName: userName))),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: const Icon(Icons.person,size: 18)
          ),
          Text(
            userName,
            style: const TextStyle(fontSize: 11),
          )
        ],
      )
    );
  }
}