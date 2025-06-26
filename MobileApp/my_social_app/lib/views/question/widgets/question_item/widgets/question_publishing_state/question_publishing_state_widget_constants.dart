import 'package:flutter/material.dart';
import 'package:my_social_app/models/languages.dart';

const _published = {
  Languages.en: "",
  Languages.tr: ""
};

const _notPublished = {
  Languages.en: "This question has not been published yet. Only you can see it.",
  Languages.tr: "Bu soru henüz yayınlanmadı. Sadece sen görebilirsin."
};

const _rejected = {
  Languages.en: "This post does not comply with SolTake's terms of use. Only you can see this question.",
  Languages.tr: "Bu paylaşım SolTake' in kullanım şartlarına uymuyor. Bu soruyu bir tek sen görebilirsin."
};

const options = [
  _published,
  _notPublished,
  _rejected
];

const colors = [
  Colors.black,
  Colors.amber,
  Colors.red
];