class Languages{
  static const String tr = "tr";
  static const String en = "en";
  static const String defaultLanguage = en;

  static const _languages = [tr,en];

  static String language(String code){
    if(_languages.contains(code)) return code;
    return defaultLanguage;
  }
}