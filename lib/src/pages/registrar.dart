

import 'package:flutter/material.dart';
import 'package:sos/src/pages/login.dart';

//import 'botones.dart';

class RegistrarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
      children: <Widget>[
      
       _registrarse(context)
       
       ],
    ));
  }


  Widget _registrarse( BuildContext context) {

     return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 RaisedButton(
            shape: StadiumBorder(),
            color: Colors.red,
            textColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
              child: Text('Comenzar Turno ',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: ( ){

               Route registro = MaterialPageRoute(builder: (bc) =>LoginPage());
                Navigator.of(context).push(registro);
            },
          ),
         /*  RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
              child: Text('Solicitar Ayuda',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: (){

              
         Route registro = MaterialPageRoute(builder: (bc) =>BotonesPage());
                Navigator.of(context).push(registro);
              
            },
          ), */
              ],
          ),
        /*  
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
              child: Text('Comenzar',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: (){


            },
          ),
          */
        ),
     );
  }

}
