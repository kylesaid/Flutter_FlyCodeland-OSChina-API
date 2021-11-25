import 'package:http/http.dart' as http;

class NetUtil{

  static Future<String> get(String url, Map<String,dynamic>param) async{
    if(url != null && param != null && param.isNotEmpty){
      //ping param
      StringBuffer bf = StringBuffer('?');
      param.forEach((key, value) {
        bf.write('$key=$value&');
      });
      String paramStr = bf.toString();
      paramStr = paramStr.substring(0,paramStr.length - 1);
      url += paramStr;
    }
    print('requst get url:$url');
    http.Response response = await http.get(Uri(host: url));
    return response.body;
  }

  static Future<String> post(String url, Map<String,dynamic>param) async{
    http.Response response = await http.post(Uri(host: url),body: param);
    return response.body;
  }

}