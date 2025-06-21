import 'package:soltake_broker/models/languages.dart';

const examName = {
  Languages.en: "Exam name",
  Languages.tr: "Sınavın ismi"
};

const subjectName = {
  Languages.en: "Subject name",
  Languages.tr: "Dersin ismi"
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