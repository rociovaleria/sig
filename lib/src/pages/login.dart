

import 'package:flutter/material.dart';
import 'package:sos/src/bloc/provider.dart';
//import 'package:sos/src/pages/botones.dart';

import 'mapa.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _registrarse(context),
            _loginform(context),
          ],
        )
    );
  }


  Widget _loginform(BuildContext context){

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    
  
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[

            SafeArea(
              child: Container(
                height: 180.0,
              ),
            ),
            Container(
              width: size.width*0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[         //BOXSHADOW NOS PONE SOMBRAS
                        BoxShadow(
                           color: Colors. black26,
                           blurRadius: 3.0,
                           offset: Offset(0.0, 5.0),
                           spreadRadius: 3.0,
                        )
                    ]     

              ),
              child: Column(
                children: <Widget>[
                      Text('Ingreso' ,style: TextStyle(fontSize: 20.0)),
                      SizedBox( height: 60.0 ),
                      _crearEmail(bloc),
                      SizedBox( height: 20.0 ),
                      _crearPassword(bloc),
                      SizedBox( height: 20.0 ),
                      _crearNombre(bloc),
                      SizedBox( height: 20.0 ),
                      _crearTelefono(bloc),
                      SizedBox( height: 20.0 ),
                      _crearBoton(bloc),
                      SizedBox( height: 20.0 )
                ],
              ),
            ),

            Text('olvido su contra??'),
            SizedBox(height: 100.0)
          ],

      ),
    );
  }

  Widget _crearEmail(BlocLogin bloc){
    
   return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        


      return Container(

        padding: EdgeInsets.symmetric(horizontal:20.0 ),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email,color: Colors.deepPurple,),
            hintText: 'ejemploCorrero.com',
            labelText: ' Correo electronico',
            counterText: snapshot.data,
            errorText: snapshot.error

          ),

          onChanged: bloc.changeEmail,
        ),
      );
      },
    );
  }

  
  Widget _crearPassword(BlocLogin bloc){
      return 
      
      StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(

        padding: EdgeInsets.symmetric(horizontal:20.0 ),
        child: TextField(

          //keyboardType: TextInputType.emailAddress, nos permite ver lo q hay los que colocamos
          obscureText: true, // oculta lo q escribimos
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline,color: Colors.deepPurple,),
            //hintText: 'ejemploCorrero.com',
            labelText: ' Contraseña',
           // counterText: snapshot.data, muestra la contra
            errorText: snapshot.error

          ),
             onChanged: bloc.changePassword,
        ),
      );

        },
      );
      
      
  }

  Widget _crearBoton(BlocLogin bloc){  // arreglar (falta ver que ahacer con el on press)
    

   return StreamBuilder(
      stream: bloc.formValidStream ,
     
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return
        
        RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0,vertical:15.0 ),
        child: Text('INGRESAR'),
      ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
      elevation: 0.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: snapshot.hasData?(){
Route registro = MaterialPageRoute(builder: (bc) =>MapsSample());
               Navigator.of(context).push(registro);
      } : null
       );

      },
    );

    
    

  }

  Widget _registrarse (BuildContext context){

      final size = MediaQuery.of(context).size;
    final fondoLogin = Container(
      height:size.height*0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[

            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]

        )
      ),
    );
    return Stack(
        children: <Widget>[
          fondoLogin,
          Container(
            padding: EdgeInsets.only(top: 80.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.person_pin_circle,color: Colors.white,size: 100.0),
                SizedBox(height: 10.0, width: double.infinity),
                Text('Login',style: TextStyle(color: Colors.white,fontSize:25.0),)
              ],
            ),
          ),
        ],
    );


  }




  Widget _crearNombre(BlocLogin bloc){
     
      return 
      
      StreamBuilder(
        stream:  bloc.nombreStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return 


      Container(

        padding: EdgeInsets.symmetric(horizontal:20.0 ),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.person ,color: Colors.deepPurple,),
            hintText: 'Nombre',
            labelText: ' Coloque su nombre',
            errorText: snapshot.error

          ),
          onChanged: bloc.changeNombre,
        ),
      );
        },
      );



  }

  


  Widget _crearTelefono(BlocLogin bloc){
      
      
      
      return StreamBuilder(
        stream: bloc.telefonoStream ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return 

           Container(

        padding: EdgeInsets.symmetric(horizontal:20.0 ),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.phone,color: Colors.deepPurple,),
            hintText: 'telefono',
            labelText: ' Coloque su telefono',
            errorText: snapshot.error

          ),
          onChanged: bloc.changeTelefono,
        ),
      );
        },
      );
      
      
  }
}