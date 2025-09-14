import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class UserUserSearchWidget extends StatelessWidget {
  final UserUserSearchState userUserSearch;
  const UserUserSearchWidget({
    super.key,
    required this.userUserSearch
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: (){
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => UserPageById(userId: userUserSearch.userId)));
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(CreateUserUserSearchAction(searchedId: userUserSearch.userId));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: AppAvatar(avatar: userUserSearch, diameter: 55)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userUserSearch.userName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black
                        ),
                      ),
                      if(userUserSearch.name != null)
                        Text(
                          userUserSearch.name!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        )
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(RemoveUserUserSearchAction(searchedId: userUserSearch.userId));
                },
                icon: const Icon(Icons.close)
              )
            ],
          )
        ),
      ),
    );
  }
}