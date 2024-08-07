import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/message/widgets/message_item.dart';
import 'package:rxdart/rxdart.dart';

final heights = BehaviorSubject<Iterable<double?>>();

class MessageItems extends StatefulWidget {
  final Iterable<MessageState> messages;
  final ScrollController scrollController;
  final double spaceBottom;

  const MessageItems({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.spaceBottom,
  });

  @override
  State<MessageItems> createState() => _MessageItemsState();
}

class _MessageItemsState extends State<MessageItems>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.accountState!.id,
      builder: (context,accountId) => ListView.builder(
        controller: widget.scrollController,
        reverse: true,
        itemCount: widget.messages.length,
        itemBuilder: (context,index) => Container(
          margin: EdgeInsets.only(bottom: widget.spaceBottom),
          child: Builder(
            builder: (context){
              final message = widget.messages.elementAt(index);
              return Row(
                mainAxisAlignment: accountId == message.senderId ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 3 / 4,
                    child: MessageItem(
                      message: message,
                    ),
                  )
                ],
              );
            },
          ),
        )
      ),
    );
  }
}