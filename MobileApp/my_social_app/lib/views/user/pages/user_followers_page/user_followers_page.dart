import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/follows_state/actions.dart';
import 'package:my_social_app/state/app_state/follows_state/follow_state.dart';
import 'package:my_social_app/state/app_state/follows_state/selectors.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/user/pages/user_followers_page/user_followers_page_constants.dart';
import 'package:my_social_app/views/user/widgets/follows_widget.dart';

class UserFollowersPage extends StatefulWidget {
  final UserState user;
  const UserFollowersPage({super.key,required this.user});

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
        getNextPageIfReady(
          store,
          selectFollowers(store, widget.user.id),
          NextFollowersAction(userId: widget.user.id)
        );
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
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectFollowers(store, widget.user.id),
          RefreshFollowersAction(userId: widget.user.id)
        );
        return onFollowersLoaded(store, widget.user.id);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${followers[getLanguage(context)]}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(5),
            child: StoreConnector<AppState,Pagination<int,FollowState>>(
              onInit: (store) => getNextPageIfNoPage(
                store,
                selectFollowers(store, widget.user.id),
                NextFollowersAction(userId: widget.user.id)
              ),
              converter: (store) => selectFollowers(store, widget.user.id),
              builder:(context, pagination) => SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    if(pagination.isEmpty)
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                noFollowers[getLanguage(context)]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25 
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    else
                      FollowsWidget(
                        follows: pagination.values
                      ),
                    if(pagination.loadingNext)
                      const LoadingCircleWidget()
                  ],
                ),
              ),
            )
          )
        ),
    );
  }
}