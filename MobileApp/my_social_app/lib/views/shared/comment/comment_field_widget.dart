import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class CommentFieldWidget extends StatefulWidget {
  final CreateCommentState state;
  const CommentFieldWidget({super.key,required this.state});

  @override
  State<CommentFieldWidget> createState() => _CommentFieldWidgetState();
}

class _CommentFieldWidgetState extends State<CommentFieldWidget>{
  late final FocusNode _focusNode;
  late final TextEditingController _commentController;
  
  @override
  void initState() {
    _focusNode = FocusNode();
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommentFieldWidget oldWidget) {
    if(oldWidget.state.content != widget.state.content){
      _commentController.text = widget.state.content;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context){
            if(widget.state.comment != null){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You are replying to ${widget.state.comment!.formatUserName(10)}"
                  ),
                  IconButton(
                    onPressed: () => store.dispatch(const CancelReplyAction()),
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
                focusNode: _focusNode,
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: widget.state.hintText,
                  hintStyle: const TextStyle(fontSize: 12)
                ),
                onChanged: (value) => store.dispatch(ChangeContentAction(content: value)),
              ),
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: (){
                store.dispatch(const CreateCommentAction());
                _focusNode.unfocus();
              },
              child: const Icon(Icons.send)
            )
          ],
        ),
      ],
    );
  }
}