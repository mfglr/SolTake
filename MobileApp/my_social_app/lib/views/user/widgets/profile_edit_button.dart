import 'package:flutter/material.dart';
import 'package:my_social_app/views/edit_profile/pages/edit_profile_page.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfilePage())),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text(
              "Edit your profile",
              style: TextStyle(
                fontSize: 12
              ),
            )
          ),
          const Icon(
            Icons.edit,
            size: 16,
          )
        ],
      )
    );
  }
}