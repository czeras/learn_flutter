
///字符串工具类
class CBStringUtil{
  ///判断是否为空
  static bool isEmpty(String object) {
    if (object == null) return true;
    if (object.isEmpty) {
      return true;
    }
    if(object=='null'){
      return true;
    }
    return false;
  }

  ///文本统一处理，为空变成"--"
  static String getText(String text){
    if(isEmpty(text)){
      return "--";
    }else{
      return text;
    }
  }

  ///删除字符串，从右边开始
  static String removeRight(String value,{int length=1}){

    //待删除的长度大于现在长度
    if(isEmpty(value)||value.length<=length){
      return "";
    }

    String result = value.substring(0,value.length-length);

    return result;

  }


}