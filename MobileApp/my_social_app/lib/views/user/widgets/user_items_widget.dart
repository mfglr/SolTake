import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_circle_widget.dart';
import 'package:my_social_app/views/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/user_item_widget.dart';

class UserItemsWidget extends StatefulWidget {
  final Iterable<UserState> users;
  final Pagination pagination;
  final bool removeFollowerButton;
  final Function onScrollBotton;
  
  const UserItemsWidget({
    super.key,
    required this.users,
    required this.pagination,
    this.removeFollowerButton = false,
    required this.onScrollBotton
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
        widget.onScrollBotton();
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
                  user: widget.users.elementAt(index),
                  removeFollowerButton: widget.removeFollowerButton
                )
              )
          ),
          Builder(
            builder: (context){
              if(widget.pagination.loading){
                return const LoadingCircleWidget(strokeWidth: 3);
              }
              return const SpaceSavingWidget();
            } 
          )
        ]
      ),
    );
  }
}