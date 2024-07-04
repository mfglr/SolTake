import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserState state;
  const UserItemWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: (){
            Navigator.of(context).pushNamed(userPageroute,arguments: state.id);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: UserImageWidget(state: state, diameter: 60)
              ),
              Builder(
                builder: (context){
                  if(state.name != null){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.formatUserName(10),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.formatName(15),
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    );
                  }
                  return Text(
                    state.formatUserName(10),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}