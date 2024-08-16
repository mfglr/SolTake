import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CreateCommentState>(
      converter: (store) => store.state.createCommentState,
      builder: (context,state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "No Comments",
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Text(
            "Make first comment on this ${state.question != null ? 'question' : 'solution'}",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}