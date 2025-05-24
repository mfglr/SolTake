import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class OwnerWidget extends StatelessWidget {
  final int userId;
  final Widget child;
  const OwnerWidget({
    super.key,
    required this.userId,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.login.login!.id,
      builder: (context,accountId) => accountId == userId
        ? child
        : const SpaceSavingWidget(),
    );
  }
}