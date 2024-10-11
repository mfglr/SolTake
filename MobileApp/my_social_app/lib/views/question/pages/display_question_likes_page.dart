import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_icon_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayQuestionLikesPage extends StatelessWidget {
  final int questionId;
  const DisplayQuestionLikesPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: questionId)) ,
      converter: (store) => store.state.questionEntityState.entities[questionId],
      builder: (context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.display_question_likes_page_likes
            ),
          ),
          body: StoreConnector<AppState,Iterable<UserState>>(
            onInit: (store) => getNextPageIfNoPage(
              store,
              question.likes,
              NextQuestionLikesAction(questionId: questionId)
            ),
            converter: (store) => store.state.selectQuestionLikes(questionId),
            builder:(context,users) => UserItemsWidget(
              users: users,
              pagination: question.likes,
              rigthButtonBuilder: (user) => StoreConnector<AppState,int>(
                converter: (store) => store.state.accountState!.id,
                builder:(context,accountId){
                  if(accountId == user.id) return const SpaceSavingWidget();
                  return FollowIconButtonWidget(user: user);
                }
              ),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(
                  store,
                  question.likes,
                  NextQuestionLikesAction(questionId: questionId)
                );
              }
            ),
          ),
        );
      }
    );
  }
}