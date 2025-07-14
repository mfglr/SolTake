import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_incorrect_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_button.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_by_ai_button.dart';

const List<IconData> icons = [Icons.all_out_sharp, Icons.check, Icons.pending, Icons.close, Icons.upload];

class DisplayQuestionAbstractSolutionsPage extends StatefulWidget {
  final int questionId;
  const DisplayQuestionAbstractSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  State<DisplayQuestionAbstractSolutionsPage> createState() => _DisplayQuestionAbstractSolutionsPageState();
}

class _DisplayQuestionAbstractSolutionsPageState extends State<DisplayQuestionAbstractSolutionsPage> {
  final PageController _pageController = PageController();
  late final void Function() _setPage;
  double _page = 0;

  @override
  void initState() {
    _setPage = (){
      setState(() {
        _page = _pageController.page ?? 0;
      });
    };
    _pageController.addListener(_setPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_setPage);
    _pageController.dispose();
    super.dispose();
  }
 
  Widget _displayUploads(QuestionState question){
    return StoreConnector<AppState,Iterable<UploadState>>(
      converter: (store) => store.state.uploadEntityState.getUploadSolutions(question.id),
      builder: (context,items) => UploadItems(items: items),
    );
  }

  Widget _labelBuilder(QuestionState question,bool isActive, index){
    return Icon(
      icons[index],
      color: isActive ? Colors.black : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: widget.questionId)),
      converter: (store) => store.state.questionEntityState.getValue(widget.questionId),
      builder:(context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: Text(
              AppLocalizations.of(context)!.display_question_solutions_page_title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          floatingActionButton:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: CreateSolutionByAiButton(question: question)
                ),
                CreateSolutionButton(questionId: question.id,pageController: _pageController),
              ],
            ),
          body: Column(
            children: [
              LabelPaginationWidget(
                labelBuilder: (isActive,index) => _labelBuilder(question,isActive,index),
                page: _page,
                labelCount: icons.length,
                width: MediaQuery.of(context).size.width,
                initialPage: 0,
                pageController: _pageController
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    DisplaySolutionsPage(questionId: question.id),
                    DisplayCorrectSolutionsPage(questionId: question.id),
                    DisplayPendingSolutionsPage(questionId: question.id),
                    DisplayIncorrectSolutionsPage(questionId: question.id),
                    _displayUploads(question)
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

  
}