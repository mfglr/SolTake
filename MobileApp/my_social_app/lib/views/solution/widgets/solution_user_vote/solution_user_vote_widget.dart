import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class SolutionUserVoteWidget extends StatelessWidget {
  final SolutionUserVoteState solutionUserVote;
  
  const SolutionUserVoteWidget({
    super.key,
    required this.solutionUserVote
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: solutionUserVote.userId,))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: AppAvatar(
                  avatar: solutionUserVote,
                  diameter: 55
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    solutionUserVote.userName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black
                    ),
                  ),
                  if(solutionUserVote.name != null)
                    Text(
                      solutionUserVote.name!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}