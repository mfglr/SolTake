import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/message/pages/create_message_medias_page/constants.dart';
import 'package:my_social_app/views/message/pages/create_message_medias_page/widgets/message_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class CreateMessageMediasPage extends StatefulWidget {
  final Iterable<AppFile> medias;
  final num receiverId;
  final ScrollController scrollController;

  const CreateMessageMediasPage({
    super.key,
    required this.medias,
    required this.receiverId,
    required this.scrollController
  });

  @override
  State<CreateMessageMediasPage> createState() => _CreateMessageMediasPageState();
}

class _CreateMessageMediasPageState extends State<CreateMessageMediasPage> {
  late Iterable<AppFile> _medias;

  bool _validateNumberOfMedias(){
    if(_medias.length >= numberOfMaxMessageMedia){
      ToastCreator.displayError(AppLocalizations.of(context)!.create_message_images_page_media_count_error);
      return false;
    }
    return true;
  }
  
  void _addMedias(Iterable<AppFile> medias){
    _validateNumberOfMedias();
    setState(() { _medias = [..._medias,...medias].take(numberOfMaxMessageMedia); });
  }

  void _removeMedia(AppFile media){
    setState((){ _medias = _medias.where((e) => e != media); });
    if(_medias.isEmpty){
      Navigator.of(context).pop();
    }
  }

  void _createMessage(String? content){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateMessageWithMediasAction(
      id: const Uuid().v4(),
      receiverId: widget.receiverId,
      content: content,
      medias: _medias
    ));
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _medias = widget.medias.take(numberOfMaxMessageMedia);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children:[
          
          Expanded(
            child: AppFileSlider(
              medias: _medias,
              onRemoved: _removeMedia
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
            child: MessageTextField(
              hintText: AppLocalizations.of(context)!.create_message_images_page_message_field_hint_text,
              scrollController: widget.scrollController,
              receiverId: widget.receiverId,
              addMedias: _addMedias,
              createMessage: _createMessage,
              validateNumberOfMedias: _validateNumberOfMedias,
            ),
          )
        ]
      ),
    );
  }
}