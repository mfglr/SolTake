import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:badges/badges.dart' as badges;
import 'package:my_social_app/views/display_uploads_page/display_uploads_page.dart';

class UploadingsButton extends StatelessWidget {
  const UploadingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const DisplayUploadsPage())),
      icon: StoreConnector<AppState,UploadEntityState>(
        converter: (store) => store.state.uploadEntityState,
        builder: (context,state) => badges.Badge(
          badgeContent: state.length > 0 ? Text(
            state.length.toString(),
            style:const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ) : null,
          badgeStyle: badges.BadgeStyle(
            badgeColor: state.length > 0 ? Colors.green : Colors.transparent,
          ),
          child: const Icon(Icons.upload),
        ),
      )
    );
  }
}