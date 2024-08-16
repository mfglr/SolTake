import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/widgets/no_solution_image_widget.dart';
import 'package:my_social_app/views/create_solution/widgets/solution_carousel_slider_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class AddSolutionImagesPage extends StatefulWidget {
  const AddSolutionImagesPage({super.key});
  @override
  State<AddSolutionImagesPage> createState() => _AddSolutionImagesPageState();
}

class _AddSolutionImagesPageState extends State<AddSolutionImagesPage> {
  late final TextEditingController contentController;

  Future<void> _addAPhoto(CreateSolutionState state) async {
    if(state.images.length >= 3){
      ToastCreator.displayError("You can't upload up to 3 images per a solution!");
      return;
    }

    final store = StoreProvider.of<AppState>(context,listen: false);
    final dynamic image = await Navigator.of(context).pushNamed(takeImageRoute);

    if(image != null){
      store.dispatch(CreateSolutionImageAction(image: image));
    }
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    contentController = TextEditingController();
    contentController.text = store.state.createSolutionState.content ?? "";

    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CreateSolutionState>(
      converter: (store) => store.state.createSolutionState,
      builder: (context,state) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: const Text(
            "Create a Solution",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => _addAPhoto(state),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Text("Add a Photo")
                  ),
                  const Icon(Icons.add_a_photo)
                ],
              )
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pushNamed(addSolutionContentRoute),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: const Text("Continue"),
                ),
                const Icon(
                  Icons.arrow_forward,
                )
              ],
            )
          ),
        ),
        body: Builder(
          builder: (context) {
            if(state.images.isEmpty){
              return const Padding(
                padding: EdgeInsets.all(8),
                child: NoSolutionImageWidget()
              );
            }
            return SolutionCarouselSliderWidget(images: state.images);
          }
        )
      ),
    );
  }
}