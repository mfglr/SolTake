import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class DisplayUploadsPage extends StatelessWidget {
  const DisplayUploadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: "Uploads"),
      ),
      body: StoreConnector<AppState,Iterable<UploadState>>(
        converter: (store) => store.state.uploadEntityState.entities,
        builder: (context,items) => UploadItems(items: items),
      ),
    );
  }
}