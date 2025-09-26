import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/client_id_generator.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/create_solution/create_solution_page.dart';

void createSolution(BuildContext context, int questionId) =>
  Navigator
    .of(context)
    .push(MaterialPageRoute(builder: (context) => const CreateSolutionPage()))
    .then((response){
      if(response == null || !context.mounted) return;

      final store = StoreProvider.of<AppState>(context,listen: false);
      
      var content = response.content;
      var medias = response.medias;
      var id = ClientIdGenerator.generate();
      var user = store.state.currentUser!;
      var question = selectQuestion(store, questionId).entity!;
      var solution = SolutionState.create(
        id: id,
        userId: user.id,
        userName: user.userName,
        image: user.image,
        questionId: questionId,
        content: content,
        doesBelongToQuestionOfCurrentUser: question.isOwner,
        medias: medias
      );
      store.dispatch(UploadSolutionAction(solution: solution));
    });