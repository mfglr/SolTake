import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class QuestionUserLikeWidget extends StatelessWidget {
  final QuestionUserLikeState like;
  const QuestionUserLikeWidget({
    super.key,
    required this.like
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => UserPage(userId: like.userId))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: AppAvatar(
                    avatar: like,
                    diameter: 60
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      compressText(like.userName, 20),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    if(like.name != null)
                      Text(
                        compressText(like.name!, 20),
                        style: const TextStyle(
                          fontSize: 13
                        ),
                      )
                  ],
                )
              ],
            ),

            // StoreConnector<AppState,num>(
            //   converter: (store) => store.state.loginState!.id,
            //   builder: (context, id) => id == like.userId
            //     ? const SpaceSavingWidget()
            //     : like.,
            // )

          ],
        ),
      ),
    );
  }
}