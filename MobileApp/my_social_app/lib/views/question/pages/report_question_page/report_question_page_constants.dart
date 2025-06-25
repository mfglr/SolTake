import 'package:my_social_app/models/languages.dart';

const _selectAReason = {
  Languages.en: "Select a reason",
  Languages.tr: "Bir neden seç"
};

const _sexuality = {
  Languages.en: "Sexuality",
  Languages.tr: "Cinsellik"
};

const _alcohol = {
  Languages.en: "Alcohol",
  Languages.tr: "Alkol"
};

const _racism = {
  Languages.en: "Racism",
  Languages.tr: "Irkçılık"
};

const _violence = {
  Languages.en: "Violence",
  Languages.tr: "Şiddet"
};

const _other = {
  Languages.en: "Other",
  Languages.tr: "Diğer"
};


const options = [
  _selectAReason,
  _sexuality,
  _alcohol,
  _racism,
  _violence,
  _other
];


const hintText = {
  Languages.en: "What's bothering you?",
  Languages.tr: "Sizi rahatsız eden nedir?"
};

const buttonContent = {
  Languages.en: "Send",
  Languages.tr: "Gönder"
};

const reasonRequiredMessage = {
  Languages.en: "You must select a reason to report the question!",
  Languages.tr: "Soruyu şikayet edebilmek için bir neden seçmelisin!s"
};

const contentRequiredMessage = {
  Languages.en: "This field is required!",
  Languages.tr: "Bu alan boş olamaz!"
};

const contentLengthMessage = {
  Languages.en: "Complaints about questions must be greater than 2 characters and be less than 1024 characters.",
  Languages.tr: "Soru hakkındaki şikayetler 2 karakterden fazla ve 1024 karakterden az olmalıdır."
};