import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class SaveQuestionButton extends StatelessWidget {
  final QuestionState question;
  const SaveQuestionButton({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        if(question.isSaved){
          store.dispatch(UnsaveQuestionAction(questionId: question.id));
        }
        else{
          store.dispatch(SaveQuestionAction(questionId: question.id));
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Icon(question.isSaved ? Icons.bookmark : Icons.bookmark_outline) 
    );
  }
}