import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/message/pages/create_message_images_page/widgets/message_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class CreateMessageImagesPage extends StatefulWidget {
  final Iterable<AppFile> medias;
  final int receiverId;
  final ScrollController scrollController;

  const CreateMessageImagesPage({
    super.key,
    required this.medias,
    required this.receiverId,
    required this.scrollController
  });

  @override
  State<CreateMessageImagesPage> createState() => _CreateMessageImagesPageState();
}

class _CreateMessageImagesPageState extends State<CreateMessageImagesPage> {
  late Iterable<AppFile> _medias;

  bool _validateNumberOfImages(){
    if(_medias.length >= 2){
      ToastCreator.displayError(AppLocalizations.of(context)!.create_message_images_page_image_count_error);
      return false;
    }
    return true;
  }
  
  void _addImages(Iterable<AppFile> images){
    if(_medias.length + images.length > 2){
      ToastCreator.displayError(AppLocalizations.of(context)!.create_message_images_page_image_count_error);
    }
    setState(() { _medias = [..._medias,...images].take(2); });
  }

  void _removeImage(AppFile image){
    setState((){ _medias = _medias.where((e) => e != image); });
    if(_medias.isEmpty){
      Navigator.of(context).pop();
    }
  }

  void _createMessage(String? content){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateMessageWithImagesAction(
      id: const Uuid().v4(),
      receiverId: widget.receiverId,
      content: content,
      images: _medias
    ));
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _medias = widget.medias.take(2);
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
              onRemoved: _removeImage
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
            child: MessageTextField(
              hintText: AppLocalizations.of(context)!.create_message_images_page_message_field_hint_text,
              scrollController: widget.scrollController,
              receiverId: widget.receiverId,
              addImages: _addImages,
              createMessage: _createMessage,
              validateNumberOfImages: _validateNumberOfImages,
            ),
          )
        ]
      ),
    );
  }
}