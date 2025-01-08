import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class UserImageWithNamesWidget extends StatelessWidget {
  final UserState user;
  final double diameter;
  final double marginRight;
  final double userNameFontSize;
  final FontWeight userNameFontWeight;
  final double nameFontSize;
  final FontWeight nameFontWeight;
  final Color? userNameColor;
  final Color? nameColor;
  
  const UserImageWithNamesWidget({
    super.key,
    required this.user,
    this.diameter = 60,
    this.marginRight = 5,
    this.userNameFontSize = 14,
    this.nameFontSize = 12,
    this.userNameFontWeight = FontWeight.bold,
    this.nameFontWeight = FontWeight.normal,
    this.userNameColor,
    this.nameColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(right: marginRight),
          child: UserImageWidget(
            userId: user.id,
            diameter: diameter
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.formatUserName(),
              style: TextStyle(
                fontSize: userNameFontSize,
                fontWeight: userNameFontWeight,
                color: userNameColor
              ),
            ),
            if(user.name != "")
              Text(
                user.formatName(15),
                style: TextStyle(
                  fontSize: nameFontSize,
                  fontWeight: nameFontWeight,
                  color: nameColor
                ),
              )
          ],
        )
      ],
    );
  }
}