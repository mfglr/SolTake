import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/conversation_item.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class ConversationItems extends StatefulWidget {
  final Iterable<MessageState> messages;
  final void Function(int conversationId) onLongPress;
  final void Function(int converationId,bool isSelected) onPress;
  final bool Function(int conversationId) isSelected;
  final void Function() onScrollBottom;
  final Pagination pagination;

  const ConversationItems({
    super.key,
    required this.messages,
    required this.onLongPress,
    required this.onPress,
    required this.isSelected,
    required this.onScrollBottom,
    required this.pagination
  });

  @override
  State<ConversationItems> createState() => _ConversationItemsState();
}

class _ConversationItemsState extends State<ConversationItems> {
  final ScrollController _controller = ScrollController();

  void _onscrollBottom(){
    if(_controller.hasClients && _controller.position.pixels == _controller.position.maxScrollExtent){
      widget.onScrollBottom();
    }
  }

  @override
  void initState() {
    _controller.addListener(_onscrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onscrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: widget.messages.length,
            itemBuilder: (context, index) => ConversationItem(
              message: widget.messages.elementAt(index),
              onLongPressed: widget.onLongPress,
              onPress: widget.onPress,
              isSelected: widget.isSelected(widget.messages.elementAt(index).conversationId),
            ),
          ),
        ),
        if(widget.pagination.loadingNext)
          const LoadingCircleWidget()
      ],
    );
  }
}