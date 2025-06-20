import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/models/languages.dart';

const title = {
  Languages.en: "Requests",
  Languages.tr: "İstekler"
};

const icons = [ FontAwesomeIcons.penToSquare, FontAwesomeIcons.book, FontAwesomeIcons.list ];

const _exam = {
  Languages.en: "Exams",
  Languages.tr: "Sınavlar"
};

const _subject = {
  Languages.en: "Subjects",
  Languages.tr: "Dersler"
};

const _topic = {
  Languages.en: "Topics",
  Languages.tr: "Konular"
};


Iterable<String> getLabels(String language) => [
  _exam[language]!,
  _subject[language]!,
  _topic[language]!,
];