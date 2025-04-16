import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

class SearchUserWidget extends StatelessWidget {
  final SearchUserState searchUser;
  const SearchUserWidget({
    super.key,
    required this.searchUser
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
              .push(MaterialPageRoute(builder: (context) => UserPage(userId: searchUser.id)));
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(CreateUserUserSearchAction(searchedId: searchUser.id));
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: AppAvatar(avatar: searchUser, diameter: 55)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchUser.userName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black
                    ),
                  ),
                  if(searchUser.name != null)
                    Text(
                      searchUser.name!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}