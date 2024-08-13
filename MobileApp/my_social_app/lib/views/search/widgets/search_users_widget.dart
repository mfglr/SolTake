import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class SearchUsersWidget extends StatelessWidget {
  final SearchState state;
  const SearchUsersWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: StoreConnector<AppState,Iterable<UserState>>(
        onInit: (store) => store.dispatch(const GetFirstPageSearchingUsersIfNoPageAction()),
        converter: (store) => store.state.searchedUsers,
        builder: (context,users) => UserItemsWidget(
          users: users,
          pagination: state.users,
          onScrollBotton: (){
            final store = StoreProvider.of<AppState>(context, listen: false);
            store.dispatch(const GetNextPageSearchingUsersIfReadyAction());
          },
        ),
      ),
    );
  }
}