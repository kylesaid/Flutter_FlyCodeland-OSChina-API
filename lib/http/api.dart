import 'request.dart';
class Api {

  //banner
  static summaryNewBanner(){
    return Request.get('/action/apiv2/banner?catalog=1');
  }
  static login(data){
    return Request.post('/login', data: data);
  }
}