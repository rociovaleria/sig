import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

class NotificacionesProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  //initNotifications() {
  //String res = "";
  // _firebaseMessaging.requestNotificationPermissions();

  /* _firebaseMessaging.getToken().then((token) {
      print('======================token=====================');
      print(token);
      res = token.toString();
      print('*****************************correcto token guardado');

      return res;
    });*/
      Future<String> getToken() async {
    //String tokenR;
    _firebaseMessaging.requestNotificationPermissions();
    final resp = await _firebaseMessaging.getToken();
    // final decodedData = json.decode(resp);

    final tokenR = resp.toString();
    print("***********************************token*****");
    print(tokenR);
    return tokenR;
  }
    
 initNotifications() {
  
  _firebaseMessaging.getToken().then((token) {
      print('======================token=====================');
      print(token);
      return token.toString();
      print('*****************************correcto token guardado');

      
    });
  

 
    _firebaseMessaging.configure(onResume: (info) {
      print('*************************onResume');
      print('************llego la notificacion');
      print(info);
      String argumento='no-data';
      argumento=info['']??'no-data';
       _mensajesStreamController.sink.add(argumento);
    }, onMessage: (info) {
      print('*************************onResume');
      print('************llego la notificacion');
      print(info);
    });
  }

  dispose() {
    _mensajesStreamController.close();
  }
}
