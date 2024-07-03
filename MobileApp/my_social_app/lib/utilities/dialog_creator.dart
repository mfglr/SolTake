import 'package:flutter/material.dart';

class DialogCreator{
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
}