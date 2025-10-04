import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/client_id_generator.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/select_models_page.dart';


const _solutionContent = {
  Languages.en: "Your solution will be generated shortly. Please do not close the application.",
  Languages.tr: "Çözümünüz en kısa sürede oluşturulacaktır. Lütfen uygulamayı kapatmayın."
};

void createSoluitonByAI(BuildContext context, UserState user, QuestionState question) =>
  Navigator
    .of(context)
    .push(MaterialPageRoute(builder: (context) => SelectModelsPage(question: question)))
    .then((value){
      if(value != null && context.mounted){
        var solution = SolutionState.createByAi(
          id: ClientIdGenerator.generate(),
          user: user,
          question: question,
          aiModel: value.aiModel,
          content: _solutionContent[getLanguage(context)]!
        );

        final store = StoreProvider.of(context,listen: false);
        store.dispatch(CreateSolutionByAIAction(solution: solution));
      }
    });