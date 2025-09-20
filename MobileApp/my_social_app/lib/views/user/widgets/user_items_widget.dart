import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/user/widgets/user_item_widget.dart';

class UserItemsWidget extends StatefulWidget {
  final Iterable<UserState> users;
  final Pagination pagination;
  final Function onScrollBottom;
  final Widget Function(UserState user)? rigthButtonBuilder;
  final void Function(UserState)? onPressed;

  const UserItemsWidget({
    super.key,
    required this.users,
    required this.pagination,
    required this.onScrollBottom,
    this.rigthButtonBuilder,
    this.onPressed
  });

  @override
  State<UserItemsWidget> createState() => _UserItemsWidgetState();
}

class _UserItemsWidgetState extends State<UserItemsWidget> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;

  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          ...List.generate(
            widget.users.length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: UserItemWidget(
                key: ValueKey(widget.users.elementAt(index).id),
                user: widget.users.elementAt(index),
                rigthButtonBuilder: widget.rigthButtonBuilder,
                onPressed: widget.onPressed,
              )
            )
          ),
          if(widget.pagination.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}