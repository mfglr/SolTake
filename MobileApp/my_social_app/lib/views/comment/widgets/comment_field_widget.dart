import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/user_image_widget.dart';

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
        if(state.comment != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${AppLocalizations.of(context)!.comment_field_widget_reply_content} ${state.comment!.userName}"),
              IconButton(
                onPressed: (){
                  contentController.text = "";
                  store.dispatch(const CancelReplyAction());
                },
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
                builder:(context,user) => UserImageWidget(
                  image: user.image,
                  diameter: 40
                )
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: contentController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.comment_field_widget_hint_text,
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
              },
              child: const Icon(Icons.send_outlined)
            )
          ],
        ),
      ],
    );
  }
}