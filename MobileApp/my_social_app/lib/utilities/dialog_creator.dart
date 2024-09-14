import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogCreator{

  static Future<bool> showAppDialog(BuildContext context, String title, String content){
    return showDialog<bool>(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      AppLocalizations.of(context)!.show_app_dialog_cancel_button,
                    ),
                  ),
                  const Icon(Icons.close)
                ],
              )
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              }, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      AppLocalizations.of(context)!.show_app_dialog_delete_button,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              )
            )
          ],
        );
      }
    ).then((value) => value ?? false);
  }

  static Future<bool> showLogOutDialog(BuildContext context){
    return showDialog<bool>(context: 
      context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              }, 
              child: const Text("Log Out")
            )
          ],
        );
      }
    ).then((value) => value ?? false);
  }


  static Future<bool> showRemoveFollowerDialog(BuildContext context){
    return showDialog<bool>(context: 
      context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove follower'),
          content: const Text("Are you sure you want to remove the follower?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              }, 
              child: const Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              )
            )
          ],
        );
      }
    ).then((value) => value ?? false);
  }


  static Future<bool> showDeleteMessageDialog(BuildContext context){
    return showDialog<bool>(context: 
      context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Your Messages'),
          content: const Text("Are you sure you want to delete your messages?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: const Text("Cancel")
                      ),
                      const Icon(Icons.clear)
                    ],
                  )
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), 
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.red
                          ),
                        )
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  )
                )
               ],
            )
          ],
        );
      }
    ).then((value) => value ?? false);
  }
}