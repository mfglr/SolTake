import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/models/languages.dart';

const icons = [
  FontAwesomeIcons.question,
  FontAwesomeIcons.pencil,
];

const _questions = {
  Languages.en: "Questions",
  Languages.tr: "Sorular"
};

const _solutions = {
  Languages.en: "Solutions",
  Languages.tr: "Çözümler"
};

Iterable<String> getLabels(String language) => [
  _questions[language]!,
  _solutions[language]!,
];