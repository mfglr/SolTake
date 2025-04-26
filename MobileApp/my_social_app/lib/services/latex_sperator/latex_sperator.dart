import 'package:my_social_app/services/latex_sperator/base_text.dart';
import 'package:my_social_app/services/latex_sperator/latex.dart';
import 'package:my_social_app/services/latex_sperator/text.dart';

class LatexSperator {
  const LatexSperator._();
  static const LatexSperator _singleton = LatexSperator._();
  factory LatexSperator() => _singleton;

  bool _isLatexStart(int offset, String content) =>
    (content[offset] == '\\' && (content[offset + 1] == '[' || content[offset + 1] == '('));

  bool _isLatexEnd(int offset, String content) =>
    (content[offset] == '\\' && (content[offset + 1] == ']' || content[offset + 1] == ')'));

  Iterable<BaseText> seperate(String content){
    List<BaseText> r = [];
    var stringBuffer = StringBuffer();
    for(int i = 0; i < content.length; i++){
      if(_isLatexStart(i,content)){
        if(stringBuffer.isNotEmpty){
          r.add(Text(content: stringBuffer.toString()));
          stringBuffer.clear();
        }
        i += 2;
        while(i < content.length && !_isLatexEnd(i,content)){
          stringBuffer.write(content[i]);
          i++;
        }
        i += 2;
        r.add(Latex(content: stringBuffer.toString()));
        stringBuffer.clear();
      }
      else{
        stringBuffer.write(content[i]);
      }
    }
    if(stringBuffer.isNotEmpty){
      r.add(Text(content: stringBuffer.toString()));
    }
    return r;
  }

}