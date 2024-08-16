import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class AddSolutionContentPage extends StatefulWidget {
  const AddSolutionContentPage({super.key});

  @override
  State<AddSolutionContentPage> createState() => _AddSolutionContentPageState();
}

class _AddSolutionContentPageState extends State<AddSolutionContentPage> {
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _contentController.text = store.state.createSolutionState.content ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          minLines: 10,
          maxLines: 10,
          decoration: const InputDecoration(
            hintText: "Type somethings about your solution",
            border: OutlineInputBorder()
          ),
          onChanged: (value){
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(ChangeSolutionContentAction(content: value));
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: OutlinedButton(
          onPressed: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            final state = store.state.createSolutionState;
            if((state.content == null || state.content == "") && state.images.isEmpty){
              ToastCreator.displayError("You have to type a content or upload at least an image!");
              return;
            }
            store.dispatch(const CreateSolutionAction());
            Navigator.of(context).popUntil(ModalRoute.withName(addSolutionImagesRoute));
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Text("Create a Solution"),
              ),
              const Icon(Icons.create)
            ],
          )
        ),
      ),
    );
  }
}