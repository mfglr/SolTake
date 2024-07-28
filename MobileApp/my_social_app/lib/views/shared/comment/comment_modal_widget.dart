import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/comment/comment_field_widget.dart';
import 'package:my_social_app/views/shared/comment/comment_items_widget.dart';
import 'package:my_social_app/views/shared/comment/no_comments_widget.dart';

class CommentModalWidget extends StatefulWidget {
  const CommentModalWidget({super.key});
  @override
  State<CommentModalWidget> createState() => _QuestionCommentModalWidgetState();
}

class _QuestionCommentModalWidgetState extends State<CommentModalWidget> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3.25 / 4,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StoreConnector<AppState,CreateCommentState>(
          converter: (store) => store.state.createCommentState,
          builder: (context,state) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close)
                  )
                ],
              ),
              Expanded(
                child: StoreConnector<AppState,Iterable<CommentState>>(
                  onInit:(store){
                    if(state.question != null){
                      store.dispatch(
                        NextPageQuestionCommentsIfNoQuestionComments(
                          questionId: state.question!.id
                        )
                      );
                    }
                    else{
                      store.dispatch(
                        NextPageSolutionCommentsIfNoCommentsAction(
                          solutionId: state.solution!.id
                        )
                      );
                    }
                  },
                  converter: (store){
                    if(state.question != null){
                      return store.state.getQuestionComments(state.question!.id);
                    }
                    else{
                      return store.state.getSolutionComments(state.solution!.id);
                    }
                  },
                  builder: (context,comments) => Builder(
                    builder: (context) {
                      if(comments.isNotEmpty){
                        return SingleChildScrollView(
                          child: CommentItemsWidget(
                            contentController: _contentController,
                            focusNode: _focusNode,
                            comments: comments
                          )
                        );
                      }
                      return NoCommentsWidget(state: state);
                    }
                  ),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.all(10),
                child: CommentFieldWidget(
                  state: state,
                  contentController: _contentController,
                  focusNode: _focusNode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}