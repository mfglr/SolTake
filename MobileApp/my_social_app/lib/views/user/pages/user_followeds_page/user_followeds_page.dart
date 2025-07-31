import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page/user_followeds_page_constants.dart';
import 'package:my_social_app/views/user/widgets/follows_widget.dart';

class UserFollowedsPage extends StatefulWidget {
  final UserState user;
  const UserFollowedsPage({super.key,required this.user});

  @override
  State<UserFollowedsPage> createState() => _UserFollowedsPageState();
}

class _UserFollowedsPageState extends State<UserFollowedsPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      getNextPageIfReady(
        store,
        selectFolloweds(store, widget.user.id),
        NextFollowedsAction(userId: widget.user.id)
      );
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
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectFolloweds(store, widget.user.id),
          RefreshFollowedsAction(userId: widget.user.id)
        );
        return onFollowedsLoaded(store, widget.user.id);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${followings[getLanguage(context)]}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8),
          child: StoreConnector<AppState,Pagination<int,FollowState>>(
            onInit: (store) =>
              getNextPageIfNoPage(
                store,
                selectFolloweds(store, widget.user.id),
                NextFollowedsAction(userId: widget.user.id)
              ),
            converter: (store) => selectFolloweds(store, widget.user.id),
            builder: (context,pagination) => SingleChildScrollView(
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
                              noFollowings[getLanguage(context)]!,
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
                    FollowsWidget(follows: pagination.values),
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