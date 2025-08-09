import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/ai_model_state/actions.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/app_state/ai_model_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/select_models_page_texts.dart';
// import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/sorting_menu_widget/sorting_button_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/ai_models_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class SelectModelsPage extends StatefulWidget {
  final int questionId;
  const SelectModelsPage({
    super.key,
    required this.questionId
  });

  @override
  State<SelectModelsPage> createState() => _SelectModelsPageState();
}

class _SelectModelsPageState extends State<SelectModelsPage> {
  // bool _isDescending = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: appTitle[getLanguage(context)]!),
        actions: const [
          // Container(
          //   margin: const EdgeInsets.only(right: 5),
          //   child: SortingMenuWidget(
          //     changeIsDescending: () => setState(() => _isDescending = !_isDescending),
          //     isDescending: _isDescending,
          //   )
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: StoreConnector<AppState,Iterable<AIModelState>>(
          onInit: (store) => getNextEntitiesIfNoPage(store, store.state.aiModels, const GetAllAIModelsAction()),
          converter: (store) => selectAIModels(store, false),//selectAIModels(store, _isDescending)
          builder:(context,aiModels) => Column(
            children: [
              // const Text(
              //   "1 Sol = 0,00000001 \$",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold
              //   ),
              // ),
              StoreConnector<AppState, EntityContainer<QuestionState>>(
                onInit: (store) => 
                  loadIfNotLoading(
                    store,
                    selectQuestion(store, widget.questionId),
                    LoadQuestionAction(questionId: widget.questionId)
                  ),
                converter: (store) => selectQuestion(store, widget.questionId),
                builder: (context, container){
                  if(container.status == EntityStatus.success){
                    return AiModelsWidget(
                      aiModels: aiModels,
                      question: container.entity!
                    );
                  }
                  else{
                    return const LoadingCircleWidget();
                  }
                }
                
              ),
              StoreConnector<AppState,Pagination>(
                converter: (store) => store.state.aiModels,
                builder: (context,aiModels) =>
                  aiModels.loadingNext
                    ? const LoadingCircleWidget()
                    : const SpaceSavingWidget()
              )
            ],
          )
        )
      ),
    );
  }
}