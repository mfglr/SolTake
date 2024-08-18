import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class DisplayUserQuestionsPage extends StatefulWidget {
  final int questionOffset;
  final int userId;
  final int? firstDisplayedQuestionId;
  final int? commentOffset;

  const DisplayUserQuestionsPage({
    super.key,
    required this.questionOffset,
    required this.userId,
    this.firstDisplayedQuestionId,
    this.commentOffset
  });

  @override
  State<DisplayUserQuestionsPage> createState() => _DisplayUserQuestionsPageState();
}

class _DisplayUserQuestionsPageState extends State<DisplayUserQuestionsPage> {
  @override
  void initState() {
    if(widget.commentOffset != null){
      WidgetsBinding.instance.addPostFrameCallback((_){
        Navigator.of(context).push(
          ModalBottomSheetRoute(
            builder: (context) => DisplayQuestionCommentsModal(
              questionId: widget.questionOffset,
              offset: widget.commentOffset!,
            ),
            isScrollControlled: true
          )
        );
      });
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(
        AddUserQuestionsPaginationAction(
          offset: widget.questionOffset,
          userId: widget.userId
        )
      ),
      converter: (store) => store.state.userEntityState.entities[widget.userId]!,
      builder: (store,user){
        if(user == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: Text(
              "${user.userName}'s questions",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => store.dispatch(
              GetNextPageUserQuestionsIfNoPageAction(
                offset: widget.questionOffset,
                userId: widget.userId
              )
            ),
            converter: (store) => store.state.selectUserQuestions(widget.questionOffset,widget.userId),
            builder: (context,questions) => QuestionItemsWidget(
              firstDisplayedQuestionId: widget.firstDisplayedQuestionId,
              questions: questions,
              pagination: user.questionPaginations.selectPagination(widget.questionOffset),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(GetNextPageUserQuestionsIfReadyAction(offset: widget.questionOffset, userId: user.id));
              },
            ),
          ),
        );
      }
    );
  }
}