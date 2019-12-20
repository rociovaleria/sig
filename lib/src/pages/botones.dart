
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sos/src/pages/mapa.dart';
//import 'package:sos/src/pages/mapa.dart';

  class BotonesPage extends StatelessWidget {
  

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              _fondoApp(),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _titulos(),
                    _botonesRedondeados(context),
                  ],
                ),
              )
            ],
          )
        );

    }

    Widget _titulos(){

      return SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Seleccione su emergencia', style: TextStyle(color:Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0,),
              Text('para solicitar ayuda selecciones una opcion', style: TextStyle(color:Colors.white,fontSize: 18.0,)),

            ],
          ),
        ),
      );
    }

    Widget _fondoApp(){

      final gradiente =Container(

        width:double.infinity ,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.7),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]
          )
        ) ,
      );

      final cajaRoja =Transform.rotate(
        angle: -pi/5.0,
        child: 
        Container(
              height: 360.0,
              width: 360.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                  colors:[
                     Color.fromRGBO(236, 98, 188, 1.0),
                     Color.fromRGBO(241, 142, 172, 1.0),
                  ]
                )
              ),
        ),
      );
      
      

        return Stack(
            children: <Widget>[
              gradiente,
              Positioned(
                top: -100.0,
               child: cajaRoja
              )
              
            ],
        );
      

    }


    Widget _botonesRedondeados(BuildContext context){

      return Table(
          children: [
            TableRow(
              children: [
                
       Container(
        height: 180.0,
       // width: 180.0,
        margin:  EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              

              SizedBox(height: 10.0),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(62, 66, 107, 0.7),
                radius: 40.0,
                child: Image(
                    image: AssetImage('assets/police.jpg'),
                    fit: BoxFit.cover,
                  ),
              ),
              Text('POLICIA',style: TextStyle(color: Colors.pinkAccent,fontSize: 25.0,fontWeight: FontWeight.bold)),

              RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Text('Solicitar',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: ( ){
              
               Route registro = MaterialPageRoute(builder: (bc) =>MapsSample());
               Navigator.of(context).push(registro);
              
            },
                ),

              ],
            ),
        )        
      ]
            ),



            TableRow(
              children: [
            Container(
              height: 180.0,
            // width: 180.0,
              margin:  EdgeInsets.all(10.0),
              decoration:  BoxDecoration(
                color: Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
              

              SizedBox(height: 10.0),
              CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 40.0,
                child: Image(
                        image: AssetImage('assets/ambulancia.png'),
                        fit: BoxFit.cover,
                      ),
              ),
              Text('AMBULANCIA',style: TextStyle(color: Colors.pinkAccent,fontSize: 25.0,fontWeight: FontWeight.bold)),

              RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Text('Solicitar',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: ( ){

               Route registro = MaterialPageRoute(builder: (bc) =>MapsSample());
               Navigator.of(context).push(registro);
            },
                ),

              ],
            ),
          ),
    

      ]
            ),
            TableRow(
              children: [

              

      Container(
        height: 180.0,
       // width: 180.0,
        margin:  EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
    /////////////////////////////////////////AUIIIIIIIII          

              SizedBox(height: 10.0),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(52, 54, 101, 1.0),
                radius: 40.0,
                child:Image(
                        image: AssetImage('assets/bomberos.png'),
                        fit: BoxFit.cover,
                      ),
              ),
              Text('BOMBEROS',style: TextStyle(color: Colors.pinkAccent,fontSize: 25.0,fontWeight: FontWeight.bold)),

              RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Text('Solicitar',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: ( ){
 Route registro = MaterialPageRoute(builder: (bc) =>MapsSample());
               Navigator.of(context).push(registro);

            },
              ),

            ],
          ),
      ),
    

                
              ]
            )
          ],

      );
    }
/*
    Widget _crearBotonRedondeado(){

      return Container(
        height: 180.0,
       // width: 180.0,
        margin:  EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              

              SizedBox(height: 10.0),
              CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 40.0,
                child: Icon(Icons.error,color: Colors.white,size: 50.0),
              ),
              Text('ITEMS',style: TextStyle(color: Colors.pinkAccent)),

              RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Text('Solicitar',style: TextStyle(fontSize: 20.0)),
            ),
            onPressed: ( ){},
              ),

            ],
          ),
      );
    }
*/
  }

