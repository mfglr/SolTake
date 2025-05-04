import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page.dart';
import 'package:uuid/uuid.dart';

class CreateSolutionButton extends StatelessWidget {
  final int questionId;
  final PageController pageController;
  const CreateSolutionButton({
    super.key,
    required this.questionId,
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
                    questionId: questionId,
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