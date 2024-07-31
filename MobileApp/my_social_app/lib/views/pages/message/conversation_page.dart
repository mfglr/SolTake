import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/message/message_field.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class ConversationPage extends StatelessWidget {
  final UserState user;
  const ConversationPage({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: user.id, userName: null))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: UserImageWidget(userId: user.id, diameter: 50)
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Builder(builder: (context){
                      if(user.name != null){
                        return Text(
                          user.name!,
                          style: const TextStyle(fontSize: 11),
                        );
                      }
                      return SizedBox.fromSize(); 
                    })
                  ],
                )
              ],
            ),
          ),
          leading: const AppBackButtonWidget(),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(5,20,5,20),
          child: MessageField(user: user,),
        ),
      ),
    );
  }
}