import 'package:soltake_broker/models/languages.dart';

const subjectName = {
  Languages.en: "Subject Name",
  Languages.tr: "Ders Adı"
};

const topicName = {
  Languages.en: "Topic Name",
  Languages.tr: "Konu Adı"
};


const _alreadyDefined = {
  Languages.en: "The topic has already been created!",
  Languages.tr: "Bu konu daha önce oluşturulmuş!"
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