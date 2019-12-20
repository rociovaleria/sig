
import 'package:flutter/material.dart';
import 'package:sos/src/bloc/provider.dart';
import 'package:sos/src/pages/botones.dart';
import 'package:sos/src/pages/formularioTrabajador.dart';
import 'package:sos/src/pages/login.dart';
import 'package:sos/src/pages/registrar.dart';
import 'package:sos/src/pages/mapa.dart';
import 'package:sos/src/providers/notificaciones_provider.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'src/pages/scroll_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
   final token=new NotificacionesProvider();
   
  
  @override
  Widget build(BuildContext context) {
     token.initNotifications();
    //token.mensajes.listen((argumento){
       print('argumento de la data');
       //navigatorkey.currentState.pushNamed('mapaTrabajador');
    
    // aumente en el return provider y dentro de el un child donde esta lo standar que estaba antes
    return Provider(
      child: 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'principal',

      routes:  <String, WidgetBuilder>{
        'principal' : (BuildContext context) => ScrollPage(),
        'registrar' : (BuildContext context) => RegistrarPage(),
          'login'   : (BuildContext context) => LoginPage(),
          'botones' : (BuildContext context) => BotonesPage(),
          'mapa'    : (BuildContext context) =>MapsSample(),
          'formtrabajador': (BuildContext context)=>FormularioTrabajador(),

      },
    )
    );

    
    
    
    
    
    
    
  }
}

