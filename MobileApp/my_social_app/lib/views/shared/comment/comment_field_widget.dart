import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class CommentFieldWidget extends StatelessWidget {
  final CreateCommentState state;
  final TextEditingController contentController;
  final FocusNode focusNode;

  const CommentFieldWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context){
            if(state.comment != null){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You are replying to ${state.comment!.userName}"),
                  IconButton(
                    onPressed: (){
                      store.dispatch(const CancelReplyAction());
                      store.dispatch(const ChangeContentAction(content: ""));
                      contentController.text = "";
                    },
                    icon: const Icon(Icons.clear)
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: StoreConnector<AppState,AccountState?>(
                converter: (store) => store.state.accountState,
                builder:(context,accountState) => UserImageWidget(
                  userId: accountState!.id,
                  diameter: 36
                )
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: contentController,
                decoration: InputDecoration(
                  hintText: state.hintText,
                  hintStyle: const TextStyle(fontSize: commentTextFontSize)
                ),
                onChanged: (value) => store.dispatch(
                  ChangeContentAction(
                    content: value
                  )
                ),
              ),
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: (){
                store.dispatch(const CreateCommentAction());
                contentController.text = "";
                focusNode.unfocus();
              },
              child: const Icon(Icons.send)
            )
          ],
        ),
      ],
    );
  }
}