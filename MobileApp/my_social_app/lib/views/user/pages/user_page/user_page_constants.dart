import 'package:flutter/material.dart';
import 'package:my_social_app/models/languages.dart';

const icons = [ Icons.border_all_rounded, Icons.check_circle, Icons.pending ];

const published = {
  Languages.en: "All",
  Languages.tr: "Hepsi"
};
const solved = {
  Languages.en: "Solved",
  Languages.tr: "Çözümlü"
};
const unsolved = {
  Languages.en: "Unsolved",
  Languages.tr: "Çözümsüz"
};

Iterable<String> getLabels(String language) => [
  published[language]!,
  solved[language]!,
  unsolved[language]!
];