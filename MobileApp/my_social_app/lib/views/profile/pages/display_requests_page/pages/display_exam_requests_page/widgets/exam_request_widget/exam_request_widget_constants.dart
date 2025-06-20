import 'package:my_social_app/models/languages.dart';

const examName = {
  Languages.en: "Name of the exam",
  Languages.tr: "Sınavı ismi"
};

const initialism = {
  Languages.en: "Exam initialism",
  Languages.tr: "Sınavın Kısaltması"
};

const _alreadyDefined = {
  Languages.en: "The exam has already been created!",
  Languages.tr: "Bu sınav daha önce oluşturulmuş!"
};

const _noReason = {
  Languages.en: "No reason!",
  Languages.tr: "Bir neden yok!"
};

const _unacceptableContent = {
  Languages.en: "Unacceptable content",
  Languages.tr: "Kabul edilmeyen içerik"
};

const rejectionReasons = [
  _noReason,
  _alreadyDefined,
  _unacceptableContent
];