import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/message/pages/create_conversation_page/widgets.dart/create_conversation_page_user_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class CreateConversationPage extends StatelessWidget {
  const CreateConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.loginState!.id)),
      converter: (store) => store.state.userEntityState.getValue(store.state.loginState!.id),
      builder: (context,user){
        if(user == null) return const LoadingView();
         return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.create_conversation_page_title,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreConnector<AppState,Iterable<UserState>>(
              onInit: (store) => getNextPageIfNoPage(store,user.conversations, NextUserConversationsAction(userId: user.id)),
              converter: (store) => store.state.selectUserConversations(store.state.loginState!.id),
              builder: (context,users) => CreateConversationPageUserItems(
                users: users,
                pagination: user.conversations,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  getNextPageIfReady(store,user.conversations, NextUserConversationsAction(userId: user.id));
                }
              )
            ),
          ),
        );
      }
    );
  }
}