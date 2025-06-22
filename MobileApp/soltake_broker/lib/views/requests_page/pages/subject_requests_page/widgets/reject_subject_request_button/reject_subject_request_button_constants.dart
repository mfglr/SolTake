import 'package:soltake_broker/models/languages.dart';

const _selectAReason = {
  Languages.en: "Select a reason",
  Languages.tr: "Bir nenden seç!"
};

const _alreadyDefined = {
  Languages.en: "Already created",
  Languages.tr: "Zaten Oluşturulmuş"
};

const _unacceptableContent = {
  Languages.en: "Unacceptable content",
  Languages.tr: "Kabul edilmeyen içerik"
};

const reasons = [
  _selectAReason,
  _alreadyDefined,
  _unacceptableContent
];

const reasonNotSelectedErrorMessage = {
  Languages.en: "You have to select a reason to reject the exam request!",
  Languages.tr: "Sınav oluşturma isteğini reddetmek için bir neden seçmelisin!"
};