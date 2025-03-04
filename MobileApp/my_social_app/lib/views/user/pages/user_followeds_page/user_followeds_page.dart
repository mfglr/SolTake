import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page/widgets/followeds_widget.dart';
import 'package:my_social_app/views/user/widgets/no_follows.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFollowedsPage extends StatefulWidget {
  final int userId;
  const UserFollowedsPage({super.key,required this.userId});

  @override
  State<UserFollowedsPage> createState() => _UserFollowedsPageState();
}

class _UserFollowedsPageState extends State<UserFollowedsPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      final pagination = store.state.userEntityState.getValue(widget.userId)!.followeds;
      getNextPageIfReady(store,pagination,NextUserFollowedsAction(userId: widget.userId));
    }
  );

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      onInit: (store){
        final pagination = store.state.userEntityState.getValue(widget.userId)!.followeds;
        getNextPageIfNoPage(store, pagination, NextUserFollowedsAction(userId: widget.userId));
      },
      converter: (store) => store.state.userEntityState.getValue(widget.userId)!,
      builder: (context,user) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${user.userName} ${AppLocalizations.of(context)!.user_followeds_page_title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8),
          child: Builder(
            builder: (context) {
              if(user.numberOfFolloweds <= 0){
                return NoFollows(
                  user: user,
                  message: AppLocalizations.of(context)!.user_followeds_page_no_followings
                );
              }
              return SingleChildScrollView(
                controller: _controller,
                child: FollowedsWidget(followeds: user.followeds.values,)
              );
            }
          )
        )
      ),
    );
  }
}