import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/message/pages/create_message_images_page/widgets/message_text_field.dart';
import 'package:my_social_app/views/message/pages/create_message_images_page/widgets/carousel_slider_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateMessageImagesPage extends StatefulWidget {
  final Iterable<XFile> images;
  final int receiverId;
  const CreateMessageImagesPage({
    super.key,
    required this.images,
    required this.receiverId,
  });

  @override
  State<CreateMessageImagesPage> createState() => _CreateMessageImagesPageState();
}

class _CreateMessageImagesPageState extends State<CreateMessageImagesPage> {
  late Iterable<XFile> _images;
  
  void _addImages(Iterable<XFile> images){
    if(_images.length + images.length > 2){
      ToastCreator.displayError(AppLocalizations.of(context)!.create_message_images_page_image_count_error);
    }
    setState(() { _images = [..._images,...images].take(2); });
  }

  void _removeImage(XFile image){
    setState((){ _images = _images.where((e) => e != image); });
    if(_images.isEmpty){
      Navigator.of(context).pop();
    }
  }

  void _createMessage(String? content){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateMessageWithImagesAction(receiverId: widget.receiverId, content: content, images: _images));
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _images = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children:[
          
          Expanded(
            child: CarouselSliderWidget(
              images: _images,
              removeImage: _removeImage
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
            child: MessageTextField(
              hintText: AppLocalizations.of(context)!.create_message_images_page_message_field_hint_text,
              receiverId: widget.receiverId,
              addImages: _addImages,
              createMessage: _createMessage,
            ),
          )
          
        ]
      ),
    );
  }
}