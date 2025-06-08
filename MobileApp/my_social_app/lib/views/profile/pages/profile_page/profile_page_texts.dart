import 'package:flutter/material.dart';
import 'package:my_social_app/models/languages.dart';
// import 'package:my_social_app/models/languages.dart';

const icons = [Icons.visibility,Icons.visibility_off, Icons.close, Icons.check_circle, Icons.pending, ];

const published = {
  Languages.en: "Published",
  Languages.tr: "Yayında"
};
const unpublished = {
  Languages.en: "Unpublished",
  Languages.tr: "Yayınlanmayanlar"
};
const rejected = {
  Languages.en: "Rejected",
  Languages.tr: "Reddedilenler"
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
  unpublished[language]!,
  rejected[language]!,
  solved[language]!,
  unsolved[language]!
];