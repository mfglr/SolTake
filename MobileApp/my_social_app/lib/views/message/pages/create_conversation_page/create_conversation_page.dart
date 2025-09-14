import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/user_user_conversation_state/actions.dart';
import 'package:my_social_app/state/user_user_conversation_state/selectors.dart';
import 'package:my_social_app/state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/message/pages/create_conversation_page/widgets.dart/user_user_conversation_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class CreateConversationPage extends StatefulWidget {
  const CreateConversationPage({super.key});

  @override
  State<CreateConversationPage> createState() => _CreateConversationPageState();
}

class _CreateConversationPageState extends State<CreateConversationPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextPageIfReady(store,selectUserUserConversationPagination(store), const NextUserUserConversationsAction());
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getPrevPageIfReady(store, store.state.conversations, const FirstUserUserConversationsAction());
        return store.onChange.map((state) => state.userUserConversations).firstWhere((x) => !x.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: AppTitle(
            title: AppLocalizations.of(context)!.create_conversation_page_title,
          ),
        ),
        body: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StoreConnector<AppState,Iterable<UserUserConversationState>>(
                onInit: (store) => getNextEntitiesIfNoPage(
                  store,
                  selectUserUserConversationPagination(store),
                  const NextUserUserConversationsAction()
                ),
                converter: (store) => selectUserUserConversations(store),
                builder: (context,userUserConversations) => UserUserConversationItems(
                  userUserConversations: userUserConversations,
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}