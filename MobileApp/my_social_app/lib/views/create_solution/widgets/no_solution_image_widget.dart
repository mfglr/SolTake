import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

class NoSolutionImageWidget extends StatelessWidget {
  const NoSolutionImageWidget({super.key});

  Future<void> _addAPhoto(BuildContext context) async {
    final store = StoreProvider.of<AppState>(context,listen: false);
    final dynamic image = await Navigator.of(context).pushNamed(takeImageRoute);
    if(image != null){
      store.dispatch(CreateSolutionImageAction(image: image));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Upload an image to highlight your solution.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25
          ),
        ),
        TextButton(
          onPressed: () => _addAPhoto(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Text(
                  "Add a Photo",
                  style: TextStyle(
                    fontSize: 25
                  ),
                )
              ),
              const Icon(
                Icons.add_a_photo,
                size: 30,
              )
            ],
          )
        )
      ],
    );
  }
}