import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/question/question_items_widget.dart';

class DisplayUserQuestionsPage extends StatelessWidget {
  const DisplayUserQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserState;
    
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          "${user.formatName(10)}'s questions",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => store.dispatch(NextPageOfUserQuestionsAction(userId: user.id)),
        converter: (store) => store.state.questionEntityState.getByUserId(user.id),
        builder: (context,questions) => QuestionItemsWidget(
          questions: questions.toList(),
        ),
      ),
    );
  }
}