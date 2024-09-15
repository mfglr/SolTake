import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/widgets/no_solution_image_widget.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/widgets/solution_carousel_slider_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class AddSolutionImagesPage extends StatefulWidget {
  const AddSolutionImagesPage({super.key});
  @override
  State<AddSolutionImagesPage> createState() => _AddSolutionImagesPageState();
}

class _AddSolutionImagesPageState extends State<AddSolutionImagesPage> {
  late final TextEditingController contentController;

  Future<void> _addAPhoto(CreateSolutionState state){
    if(state.images.length >= 3){
      ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_images_page_error);
      return Future.value();
    }

    final store = StoreProvider.of<AppState>(context,listen: false);
    Navigator
      .of(context)
      .pushNamed(takeImageRoute)
      .then((image){
        if(image != null){
          store.dispatch(CreateSolutionImageAction(image: image as XFile));
        }
      });
      return Future.value();
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
          title: AppTitle(
            title: AppLocalizations.of(context)!.add_solution_images_page_title,
          ),
          actions: [
            TextButton(
              onPressed: () => _addAPhoto(state),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Text(AppLocalizations.of(context)!.add_solution_images_page_add_photo_button)
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
                  child: Text(
                    AppLocalizations.of(context)!.add_solution_images_page_continue_button,
                  ),
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