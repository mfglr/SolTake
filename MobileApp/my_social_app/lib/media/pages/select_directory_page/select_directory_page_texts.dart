import 'package:my_social_app/models/languages.dart';

const selectedMedia = {
  Languages.en: "The Selected Media",
  Languages.tr: "Seçilen Medyalar"
};

const title = {
  Languages.en: "Select Media",
  Languages.tr: "Medya Seç"
};

const preview = {
  Languages.en: "Preview",
  Languages.tr: "Önizle"
};

const confirmSelections = {
  Languages.en: "Confirm the selections",
  Languages.tr: "Seçimleri onayla"
};

Map<String, String> _getMaxMediaExceptionContent(int numberOfMaxMedia) => {
  Languages.en: "You can select up to $numberOfMaxMedia media.",
  Languages.tr: "En fazla $numberOfMaxMedia adet medya seçebilirsin.",
};

String getMaxMediaExceptionContent(int numberOfMaxMedia, String language) =>
  _getMaxMediaExceptionContent(numberOfMaxMedia)[language]!;

