import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/loading_circle_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/space_saving_widget.dart';

class DisplayQuestionCommentsModal extends StatefulWidget {
  final int questionId;
  const DisplayQuestionCommentsModal({super.key,required this.questionId});

  @override
  State<DisplayQuestionCommentsModal> createState() => _DisplayQuestionCommentsModalState();
}

class _DisplayQuestionCommentsModalState extends State<DisplayQuestionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late final void Function() _nextPageComments;

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _nextPageComments = (){
      if(_scrollController.hasClients){
        final position = _scrollController.position;
        final pagination = store.state.questionEntityState.entities[widget.questionId]!.comments;
        if(position.pixels == position.maxScrollExtent && !pagination.isLast && !pagination.loading){
          store.dispatch(GetNextPageQuestionCommentsAction(questionId: widget.questionId));
        }
      }
    };
    _scrollController.addListener(_nextPageComments);
    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    _scrollController.removeListener(_nextPageComments);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3.50 / 4,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
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
              child: SingleChildScrollView(
                controller: _scrollController,
                child: StoreConnector<AppState,Iterable<CommentState>>(
                  onInit:(store) => store.dispatch(GetNextPageQuestionCommentsIfNoPageAction(questionId: widget.questionId)),
                  converter: (store) => store.state.getQuestionComments(widget.questionId),
                  builder: (context,comments) => StoreConnector<AppState,QuestionState>(
                    converter: (store) => store.state.questionEntityState.entities[widget.questionId]!,
                    builder: (context,question) => Column(
                      children: [
                        Builder(
                          builder: (context) {
                            if(question.comments.isLast && question.comments.ids.isEmpty){
                              return const NoCommentsWidget();
                            }
                            return CommentItemsWidget(
                              contentController: _contentController,
                              focusNode: _focusNode,
                              comments: comments
                            );
                          }
                        ),
                        Builder(
                          builder: (context){
                            if(question.comments.loading){
                              return const LoadingCircleWidget(strokeWidth: 2);
                            }
                            return const SpaceSavingWidget();
                          }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,20),
              child: StoreConnector<AppState,CreateCommentState>(
                converter: (store) => store.state.createCommentState,
                builder: (context,state) => CommentFieldWidget(
                  state: state,
                  contentController: _contentController,
                  focusNode: _focusNode,
                  scrollController: _scrollController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}