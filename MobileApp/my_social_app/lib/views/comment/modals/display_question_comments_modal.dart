import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class DisplayQuestionCommentsModal extends StatefulWidget {
  final int offset;
  final int questionId;
  const DisplayQuestionCommentsModal({super.key,required this.offset,required this.questionId});

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
        if(position.pixels == position.maxScrollExtent){
          store.dispatch(GetNextPageQuestionCommentsIfReadyAction(offset: widget.offset, questionId: widget.questionId));
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
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(
        AddQuestionCommentsPaginationAction(
          offset: widget.offset,
          questionId: widget.questionId
        )
      ),
      converter: (store) => store.state.questionEntityState.entities[widget.questionId],
      builder: (context,question){
        if(question == null || question.commentPaginations.paginations[widget.offset] == null){
          return const LoadingView();
        }
        
        final store = StoreProvider.of<AppState>(context,listen:false);
        store.dispatch(ChangeQuestionAction(question: question));

        return SizedBox(
          height: MediaQuery.of(context).size.height * 3 / 4,
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
                      onInit:(store){
                        store.dispatch(
                          GetNextPageQuestionCommentsIfNoPageAction(
                            offset: widget.offset,
                            questionId: widget.questionId
                          )
                        );
                      },
                      converter: (store) => store.state.getQuestionComments(widget.offset,widget.questionId),
                      builder: (context,comments) => Column(
                        children: [
                          Builder(
                            builder: (context) {
                              final pagination = question.commentPaginations.selectPagination(widget.offset);
                              if(pagination.isLast && pagination.ids.isEmpty){
                                return const NoCommentsWidget();
                              }
                              return CommentItemsWidget(
                                offset: widget.offset,
                                contentController: _contentController,
                                focusNode: _focusNode,
                                comments: comments
                              );
                            }
                          ),
                          Builder(
                            builder: (context){
                              final pagination = question.commentPaginations.selectPagination(widget.offset);
                              if(pagination.loading){
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
    );
  }
}