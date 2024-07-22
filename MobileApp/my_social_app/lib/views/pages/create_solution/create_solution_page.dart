import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/exceptions/frontend_exception.dart';
import 'package:my_social_app/state/create_solution_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/pages/create_solution/widgets/solution_carousel_slider_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class CreateSolutionPage extends StatefulWidget {

  const CreateSolutionPage({super.key});


  @override
  State<CreateSolutionPage> createState() => _CreateSolutionPageState();
}

class _CreateSolutionPageState extends State<CreateSolutionPage> {
  late final TextEditingController contentController;

  @override
  void initState() {
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButtonWidget(
          onPressed: () => store.dispatch(const ClearCreateSolutionStateAction())
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.of(context).pushNamed(takeSolutionImageRoute),
        shape: const CircleBorder(),
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: (){
            if(contentController.text == ""){
              throw const FrontendException(message:"You must type a content for solution!");
            }
            if(store.state.createSolutionState.images.length > 10){
              throw const FrontendException(message:"You can upload up to 10 images per solution!");
            }
            store.dispatch(const CreateSolutionAction());
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Text("Create Solution")
              ),
              const Icon(Icons.create)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: TextField(
                minLines: 5,
                maxLines: 5,
                controller: contentController,
                onChanged: (value) => store.dispatch(ChangeSolutionContentAction(content: value)),
                decoration: const InputDecoration(
                  hintText: "Type somethings about the solution...",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: StoreConnector<AppState,Iterable<XFile>>(
                converter: (store) => store.state.createSolutionState.images, 
                builder: (context,images) => SolutionCarouselSliderWidget(images: images)
              ),
            )
          ],
        ),
      ),
    );
  }
}