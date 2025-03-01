import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/pages/user_followers_page/widgets/followers_widget.dart';
import 'package:my_social_app/views/user/widgets/no_follows.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFollowersPage extends StatefulWidget {
  final int userId;
  const UserFollowersPage({super.key,required this.userId});

  @override
  State<UserFollowersPage> createState() => _UserFollowersPageState();
}

class _UserFollowersPageState extends State<UserFollowersPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom(){
    onScrollBottom(
      _controller,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        var pagination = store.state.userEntityState.getValue(widget.userId)!.followers;
        getNextPageIfReady(store,pagination,NextUserFollowersAction(userId: widget.userId));
      }
    );
  }

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
        var pagination = store.state.userEntityState.getValue(widget.userId)!.followers;
        getNextPageIfNoPage(store, pagination, NextUserFollowersAction(userId: widget.userId));
      },
      converter: (store) => store.state.userEntityState.getValue(widget.userId)!,
      builder: (context,user) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${user.userName} ${AppLocalizations.of(context)!.user_followers_page_title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: Builder(
            builder: (context) {
              if(user.numberOfFollowers <= 0){
                return NoFollows(
                  user: user,
                  message: AppLocalizations.of(context)!.user_followers_page_no_followers
                );
              }
              return SingleChildScrollView(
                child: FollowersWidget(
                  followers: user.followers.values
                ),
              );
            }
          )
        )
      )
    );
  }
}