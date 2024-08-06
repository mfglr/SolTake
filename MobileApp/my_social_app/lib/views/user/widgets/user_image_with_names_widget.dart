import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class UserImageWithNamesWidget extends StatelessWidget {
  final UserState user;
  final double diameter;
  final double marginRight;
  final double userNameFontSize;
  final FontWeight userNameFontWeight;
  final double nameFontSize;
  final FontWeight nameFontWeight;
  
  const UserImageWithNamesWidget({
    super.key,
    required this.user,
    required this.diameter,
    required this.marginRight,
    required this.userNameFontSize,
    required this.nameFontSize,
    required this.userNameFontWeight,
    required this.nameFontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(right: marginRight),
          child: UserImageWidget(userId: user.id,diameter: diameter),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.userName,
              style: TextStyle(
                fontSize: userNameFontSize,
                fontWeight: userNameFontWeight
              ),
            ),
            Builder(
              builder: (context){
                if(user.name == null) return const SizedBox.shrink();
                return Text(
                  user.name!,
                  style: TextStyle(
                    fontSize: nameFontSize,
                    fontWeight: nameFontWeight
                  ),
                );
              }
            )
          ],
        )
      ],
    );
  }
}