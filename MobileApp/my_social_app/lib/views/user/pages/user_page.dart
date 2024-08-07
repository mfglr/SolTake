import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';
import 'package:my_social_app/views/user/widgets/user_info_card_widget.dart';


class UserPage extends StatelessWidget {
  final int? userId;
  final String? userName;
  const UserPage({
    super.key,
    required this.userId,
    required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState?>(
      onInit: (store){
        if(userId != null){
          store.dispatch(LoadUserAction(userId: userId!));
        }
        if(userName != null){
          store.dispatch(LoadUserByUserNameAction(userName: userName!));
        }
      },
      converter: (store){
        if(userId != null){
          return store.state.userEntityState.entities[userId];
        }
        return store.state.userEntityState.entities.values.where((e) => e.userName == userName).firstOrNull;
      },
      builder: (context, user){
        if(user != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(user.userName),
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: UserInfoCardWidget(user: user)
                ),
                Expanded(
                  child: StoreConnector<AppState,Iterable<QuestionState>>(
                    onInit: (store) => store.dispatch(NextPageOfUserQuestionsIfNoQuestionsAction(userId: user.id)),
                    converter: (store) => store.state.questionEntityState.selectQuestionsByUserId(user.id),
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