import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class CommentFieldWidget extends StatelessWidget {
  final CreateCommentState state;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final ScrollController scrollController;

  const CommentFieldWidget({
    super.key,
    required this.state,
    required this.contentController,
    required this.focusNode,
    required this.scrollController
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
                      contentController.text = "";
                      store.dispatch(const CancelReplyAction());
                    },
                    icon: const Icon(Icons.clear)
                  )
                ],
              );
            }
            return const SpaceSavingWidget();
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
                  diameter: 40
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
                onChanged: (value) => store.dispatch(ChangeContentAction(content: value)),
              ),
            ),
            FilledButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(13)
              ),
              onPressed: (){
                store.dispatch(const CreateCommentAction());
                contentController.text = "";
                focusNode.unfocus();
                if(state.comment == null){
                  scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                }
              },
              child: const Icon(Icons.send_outlined)
            )
          ],
        ),
      ],
    );
  }
}