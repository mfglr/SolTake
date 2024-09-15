import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        Text(
          AppLocalizations.of(context)!.no_solution_image_widget_label,
          textAlign: TextAlign.center,
          style: const TextStyle( fontSize: 25 ),
        ),
        TextButton(
          onPressed: () => _addAPhoto(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  AppLocalizations.of(context)!.no_solution_image_widget_add_photo_button,
                  style: const TextStyle(
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