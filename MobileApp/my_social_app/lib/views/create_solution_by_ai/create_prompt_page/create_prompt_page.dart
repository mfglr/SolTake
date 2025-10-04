import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/create_prompt_page_texts.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/widgets/create_solution_button/create_solution_button.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';

class CreatePromptPage extends StatefulWidget {
  final Uint8List bytes;
  const CreatePromptPage({
    super.key,
    required this.bytes
  });

  @override
  State<CreatePromptPage> createState() => _CreatePromptPageState();
}

class _CreatePromptPageState extends State<CreatePromptPage> {
  String _prompt = "";
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = defaultPrompt[getLanguage(context)]!;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: title[getLanguage(context)]!),
        actions: [
          CreateSolutionButton(
            prompt: _prompt,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.memory(
              widget.bytes,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: _controller,
                minLines: 10,
                maxLines: null,
                onChanged: (value) => setState(() => _prompt = value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}