import 'package:collection/collection.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';

class SolutionUserVoteEntityState extends EntityState<SolutionUserVoteState>{
  const SolutionUserVoteEntityState({
    required super.entities
  });

  SolutionUserVoteEntityState addVotes(Iterable<SolutionUserVoteState> votes)
    => SolutionUserVoteEntityState(entities: appendMany(votes));
  SolutionUserVoteEntityState addVote(SolutionUserVoteState vote)
    => SolutionUserVoteEntityState(entities: appendOne(vote));
  SolutionUserVoteEntityState removeVote(int id)
    => SolutionUserVoteEntityState(entities: removeOne(id));

  SolutionUserVoteState? select(int solutionId,int userId)
    => entities.values.firstWhereOrNull((e) => e.solutionId == solutionId && e.appUserId == userId);
}