import 'package:flutter/material.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/message/message_field.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class ConversationPage extends StatelessWidget {
  final int userId;
  final String userName;
  final String? name;
  const ConversationPage({super.key,required this.userId,required this.userName,required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: (){
              Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      userId: userId,
                      userName: null
                    )
                  )
                );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: UserImageWidget(userId: userId, diameter: 50)
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Builder(builder: (context){
                      if(name != null){
                        return Text(
                          name!,
                          style: const TextStyle(fontSize: 11),
                        );
                      }
                      return const SizedBox.shrink(); 
                    })
                  ],
                )
              ],
            ),
          ),
          leading: const AppBackButtonWidget(),
        ),
        body: ,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(5,20,5,20),
          child: MessageField(userName: userName),
        ),
      ),
    );
  }
}