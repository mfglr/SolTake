import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'comment_field_widget_texts.dart';

class CommentFieldWidget extends StatelessWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final ScrollController scrollController;
  final void Function() cancelReplying;
  final void Function() createComment;
  final CommentState? comment;

  const CommentFieldWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.scrollController,
    required this.cancelReplying,
    required this.createComment,
    required this.comment
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(comment != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageWidget(
                child: (language) => Text(
                  "${content[language]} ${comment!.userName}"
                )
              ),
              IconButton(
                onPressed: cancelReplying,
                icon: const Icon(Icons.clear)
              )
            ],
          ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: StoreConnector<AppState,UserState>(
                converter: (store) => store.state.currentUser!,
                builder:(context,user) => AppAvatar(
                  avatar: user,
                  diameter: 40
                )
              ),
            ),
            Expanded(
              child: LanguageWidget(
                child: (language) => TextField(
                  focusNode: focusNode,
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: hintText[language]!,
                    hintStyle: const TextStyle(fontSize: commentTextFontSize)
                  ),
                ),
              ),
            ),
            FilledButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(13)
              ),
              onPressed: createComment,
              child: const Icon(Icons.send_outlined)
            )
          ],
        ),
      ],
    );
  }
}
