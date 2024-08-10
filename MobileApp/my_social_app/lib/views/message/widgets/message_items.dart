import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/loading_circle_widget.dart';
import 'package:my_social_app/views/message/widgets/message_item.dart';
import 'package:my_social_app/views/space_saving_widget.dart';

class MessageItems extends StatefulWidget {
  final Iterable<MessageState> messages;
  final double spaceBottom;
  final Pagination pagination;
  final ScrollController scrollController;
  final GlobalKey lastMessageKey;

  const MessageItems({
    super.key,
    required this.messages,
    required this.pagination,
    required this.spaceBottom,
    required this.scrollController,
    required this.lastMessageKey,
  });

  @override
  State<MessageItems> createState() => _MessageItemsState();
}

class _MessageItemsState extends State<MessageItems> {


  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.lastMessageKey.currentContext != null){
        Scrollable.ensureVisible(widget.lastMessageKey.currentContext!);
      }
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.accountState!.id,
      builder: (context,accountId) => SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            Builder(
              builder: (context){
                if(widget.pagination.loading){
                  return const LoadingCircleWidget(strokeWidth: 3);
                }
                return const SpaceSavingWidget();
              }
            ),
            ...List.generate(
              widget.messages.length,
              (index) => Container(
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
            )
          ]
        )
      ),
    );
  }
}