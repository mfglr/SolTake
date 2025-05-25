import 'package:flutter/material.dart';
import 'package:my_social_app/models/languages.dart';

const draft = {
  Languages.en: "Draft",
  Languages.tr: "Taslak"
};

const published = {
  Languages.en: "Published",
  Languages.tr: "Yayında"
};

const solved = {
  Languages.en: "Solved",
  Languages.tr: "Çözümlü"
};

const unsolved = {
  Languages.en: "Unsolved",
  Languages.tr: "Çözümsüz"
};

const icons = [Icons.drafts, Icons.publish_rounded, Icons.done, Icons.pending];

Iterable<String> getLabels(String language) => [
  draft[language]!,
  published[language]!,
  solved[language]!,
  unsolved[language]!
];