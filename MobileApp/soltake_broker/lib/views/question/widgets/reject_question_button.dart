import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/question_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';

class RejectQuestionButton extends StatelessWidget {
  final QuestionState question;
  const RejectQuestionButton({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(RejectQuestionAction(questionId: question.id));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.close),
          Text("Reddet")
        ],
      )
    );
  }
}