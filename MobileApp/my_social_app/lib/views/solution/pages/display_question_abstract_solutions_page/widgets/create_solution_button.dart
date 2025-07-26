import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page.dart';
import 'package:uuid/uuid.dart';

class CreateSolutionButton extends StatelessWidget {
  final QuestionState question;
  final PageController pageController;
  const CreateSolutionButton({
    super.key,
    required this.question,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Text("Sen Çöz")
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.green,
          ),
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const AddSolutionContentPage()))
              .then((value){
                if(value == null || !context.mounted) return;
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(
                  CreateSolutionAction(
                    id: const Uuid().v4(),
                    question: question,
                    content: value.content,
                    medias: value.medias
                  )
                );
                pageController.jumpToPage(4);
              }),
          child: const Icon(Icons.create),
        ),
      ],
    );
  }
}