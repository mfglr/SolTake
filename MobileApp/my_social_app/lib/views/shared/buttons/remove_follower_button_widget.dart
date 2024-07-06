import 'package:flutter/material.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/user_state.dart';
import 'package:provider/provider.dart';

class RemoveFollowerButtonWidget extends StatelessWidget {
  
  final UserState state;
  const RemoveFollowerButtonWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        await context.read<AppProvider>().removeFollower(state.id);
        // bool remove = await DialogCreator.showRemoveFollowerDialog(context);
        // if(remove){
        //   if(!context.mounted) return;
          
        // }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("Remove")
          ),
          const Icon(Icons.remove)
        ],
      ),
    );
  }
}