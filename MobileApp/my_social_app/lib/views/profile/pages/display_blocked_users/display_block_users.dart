import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/action.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/selectors.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/views/profile/pages/display_blocked_users/display_block_users_text.dart';
import 'package:my_social_app/views/profile/pages/display_blocked_users/widgets/no_block_widget/no_block_widget.dart';
import 'package:my_social_app/views/profile/pages/display_blocked_users/widgets/user_user_block_item.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class DisplayBlockUsers extends StatefulWidget {
  const DisplayBlockUsers({super.key});

  @override
  State<DisplayBlockUsers> createState() => _DisplayBlockUsersState();
}

class _DisplayBlockUsersState extends State<DisplayBlockUsers> {
  final ScrollController _controller = ScrollController();

  void _onSCrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, selectUserUserBlocksPagination(store), const NextUserUserBlocksAction());
    }
  );

  @override
  void initState() {
    _controller.addListener(_onSCrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onSCrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ),
        ),
      ),
      body: StoreConnector<AppState,(Iterable<UserUserBlockState>,bool)>(
        onInit: (store) => getNextPageIfNoPage(store, selectUserUserBlocksPagination(store), const NextUserUserBlocksAction()),
        converter: (store) => selectForDisplayBlockUsers(store),
        builder: (context, selection) =>
          selection.$2
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NoBlockWidget(),
                  ],
                ),
              )
            : SingleChildScrollView(
                controller: _controller,
                child: AppColumn(
                  children: selection.$1.map((userUserBlock) => UserUserBlockItem(
                    userUserBlock: userUserBlock
                  ))
                ),
              )
      ),
    );
  }
}