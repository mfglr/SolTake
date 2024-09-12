import 'package:flutter/material.dart';

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

  static Future<bool> showDeleteCommentDialog(BuildContext context){
    return showDialog<bool>(context: 
      context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Your Comment'),
          content: const Text("Are you sure you want to delete your comment?"),
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
              child: const Text("Delete")
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