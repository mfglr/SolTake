import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/message/widgets/message_item.dart';

class MessageItems extends StatefulWidget {
  final Iterable<MessageState> messages;
  final Iterable<GlobalKey> keys;
  final double spaceBottom;
  final Pagination pagination;
  final ScrollController scrollController;

  const MessageItems({
    super.key,
    required this.keys,
    required this.messages,
    required this.pagination,
    required this.spaceBottom,
    required this.scrollController,
  });

  @override
  State<MessageItems> createState() => _MessageItemsState();
}

class _MessageItemsState extends State<MessageItems> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MessageItems oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(widget.keys.map((key) => key.currentContext?.size?.height));
    });
    if(oldWidget.messages.length != widget.messages.length){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // print(widget.keys.map((key) => key.currentContext?.size?.height));

        if(widget.messages.length <= messagesPerPage){
          widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent);
        }
        else{
          // widget.scrollController.animateTo(
          //   widget.scrollController.position.maxScrollExtent,
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.linear
          // );
        }
        
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.accountState!.id,
      builder: (context,accountId) => ListView.builder(
        controller: widget.scrollController,
        itemCount: widget.messages.length,
        itemBuilder: (context, index) => Container(
          key: widget.keys.elementAt(index),
          margin: EdgeInsets.only(bottom: widget.spaceBottom),
          child: Builder(
            builder: (context){
              final message = widget.messages.elementAt(index);
              return Row(
                mainAxisAlignment: accountId == message.senderId ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 3 / 4,
                    child: MessageItem(message: message),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}