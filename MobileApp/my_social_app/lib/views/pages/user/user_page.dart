import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/shared/question/question_abstract_items_widget.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';


class UserPage extends StatelessWidget {
  final int userId;
  const UserPage({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: userId)),
      converter: (store) => store.state.userEntityState.entities[userId],
      builder: (context, userState){
        if(userState != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(userState.formatUserName(10)),
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: UserInfoCardWidget(state: userState)
                ),
                Expanded(
                  child: StoreConnector<AppState,Iterable<QuestionState>>(
                    onInit: (store) => store.dispatch(NextPageOfUserQuestionsIfNoQuestionsAction(userId: userId)),
                    converter: (store) => store.state.getUserQuestions(userId),
                    builder: (context,value ) => QuestionAbstractItemsWidget(questions: value)
                  ),
                )
              ],
            )
          );
        }
        return const LoadingView();
      }
    );
  }
}