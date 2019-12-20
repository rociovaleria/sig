import 'package:flutter/material.dart';
import 'package:sos/src/pages/registrar.dart';

import 'formularioTrabajador.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,  //modifique el axis.vertical
      children: <Widget>[
      
       _pagina1(),
      
       _pagina2(context) //aumente (context) para recibir un context y poder navegar en entra page
       
       ],
    ));
  } 

  Widget _pagina1() {

    return Stack(
        children: <Widget>[
          _colorFondo(),
          _imagenFondo(),
          _textos(),

        ],
    );
  }

  Widget _colorFondo(){
    return Container(

      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 1920, 2180, 1.0),
      
    );
    
  }

  Widget _imagenFondo(){
    return Container(

      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/fru-131.jpg'), //cambie la img principal
        fit: BoxFit.cover,
      ),
    );
}


  Widget _textos(){

  //final estilo = TextStyle(color: Colors.black,fontSize: 70.0);


  return SafeArea(
  
      child: Column(
      children: <Widget>[
        SizedBox(height: 95.0),
      //  Text('ApoyoU', style: estilo),
        Expanded(child: Container()),
       // Icon(Icons.location_on, size: 60.0,color: Colors.black),
        //Divider(),
        //Divider(),
        Icon(Icons.keyboard_arrow_right, size: 70.0,color: Colors.black)
      ],
    ),
  );
}



  Widget _pagina2( BuildContext context) {  //aumente a Widget _pagina2(-*BuildContext context*-)

     return Container(
      
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,  //1000, 60, 50, 1.0 
        child: Center(
          
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
              child: Text('Comenzar',style: TextStyle(fontSize: 20.0)),
              
            ),
            onPressed: () {
                Route ruta = MaterialPageRoute(builder: (bc) =>FormularioTrabajador());
                Navigator.of(context).push(ruta);
            // Navigator.push(context, route);
            },
          ),
        ),
     );
  }
  
}
