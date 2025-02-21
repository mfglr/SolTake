import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/message/pages/conversation_page/conversation_page.dart';
import 'package:my_social_app/views/message/pages/create_conversation_page/widgets.dart/create_conversation_page_user_item.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class CreateConversationPageUserItems extends StatefulWidget {
  final Iterable<UserState> users;
  final void Function() onScrollBottom;
  final Pagination pagination;
  const CreateConversationPageUserItems({
    super.key,
    required this.users,
    required this.onScrollBottom,
    required this.pagination
  });

  @override
  State<CreateConversationPageUserItems> createState() => _CreateConversationPageUserItemsState();
}

class _CreateConversationPageUserItemsState extends State<CreateConversationPageUserItems> {
  final ScrollController _controller = ScrollController();
  late final void Function()  _onScrollBottom;

  @override
  void initState() {
    _onScrollBottom = (){
      if(_controller.hasClients && _controller.position.pixels == _controller.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context,index) => CreateConversationPageUserItem(
              key: ValueKey(widget.users.elementAt(index).id),
              user: widget.users.elementAt(index),
              onPressed: (userId) =>
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => ConversationPage(userId: userId))),
            ),
            itemCount: widget.users.length,
            controller: _controller
          ),
        ),
        if(widget.pagination.loadingNext)
          const LoadingCircleWidget()
      ],
    );
  }
}