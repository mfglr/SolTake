import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_item.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class MessageItems extends StatefulWidget {
  final Iterable<MessageState> messages;
  final double spaceBottom;
  final Pagination pagination;
  final ScrollController scrollController;
  final void Function() onScrollTop;
  final int? numberOfNewMessages;
  final void Function(int messageId) onPressedMessageItem;
  final void Function(int messageId) onLongPressedMessageItem;
  final Iterable<int> selectedMessageIds;

  const MessageItems({
    super.key,
    required this.messages,
    required this.pagination,
    required this.spaceBottom,
    required this.scrollController,
    required this.onScrollTop,
    this.numberOfNewMessages,
    required this.onPressedMessageItem,
    required this.onLongPressedMessageItem,
    required this.selectedMessageIds
  });

  @override
  State<MessageItems> createState() => _MessageItemsState();
}

class _MessageItemsState extends State<MessageItems> {

  late final void Function() _onSCrollTop;

  @override
  void initState() {
    _onSCrollTop = (){
      if(widget.scrollController.hasClients && widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent){
        widget.onScrollTop();
      }
    };
    widget.scrollController.addListener(_onSCrollTop);
    super.initState();
  }
 

  Widget _generateMessageItem(MessageState message) => 
    Container(
      color: widget.selectedMessageIds.any((e) => e == message.id) ? Colors.black.withOpacity(0.1) : null,
      margin: EdgeInsets.only(bottom: widget.spaceBottom),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: message.isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 3 / 4,
            child: MessageItem(
              selectedMessageIds: widget.selectedMessageIds,
              onPressedMesssageItem: widget.onPressedMessageItem,
              onLongPressedMessageItem: widget.onLongPressedMessageItem,
              message: message,
            )
          )
        ],
      )
    );

  @override
  void dispose() {
    widget.scrollController.removeListener(_onSCrollTop);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.pagination.loadingNext)
          const LoadingCircleWidget(strokeWidth: 3),
        Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            reverse: true,
            itemCount: widget.messages.length,
            itemBuilder: (context,index){
              final message = widget.messages.elementAt(index);
              if(
                widget.numberOfNewMessages != null &&
                widget.numberOfNewMessages != 0 &&
                index == widget.numberOfNewMessages! - 1
              ){
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You have ${widget.numberOfNewMessages} ${widget.numberOfNewMessages == 1 ? 'new message' : 'mew messages'}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _generateMessageItem(message)
                  ],
                );
              }
              return _generateMessageItem(message);
            }
          ),
        ),
      ],
    );
  }
}